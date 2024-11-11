#include "PersonSet.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Definition of the structure
struct _PersonSet_ {
  int capacity;    // the current capacity of the array
  int size;        // the number of elements currently stored
  Person **array;  // points to an array of pointers to persons
};

#define INITIAL_CAPACITY 4

// Create a PersonSet.
PersonSet *PersonSetCreate() {
  PersonSet *set = (PersonSet *)malloc(sizeof(PersonSet));
  if (set == NULL) {
    return NULL;
  }

  set->size = 0;
  set->capacity = INITIAL_CAPACITY;
  set->array = (Person **)malloc(sizeof(Person *) * set->capacity);
  if (set->array == NULL) {
    free(set);
    return NULL;
  }

  return set;
}

// Destroy PersonSet *pps
void PersonSetDestroy(PersonSet **pps) {
  assert(*pps != NULL);

  for (int i = 0; i < (*pps)->size; i++) {
    PersonDestroy(&((*pps)->array[i]));
  }

  free((*pps)->array);
  free(*pps);
  *pps = NULL;
}

int PersonSetSize(const PersonSet *ps) { return ps->size; }

int PersonSetIsEmpty(const PersonSet *ps) { return ps->size == 0; }

void PersonSetPrint(const PersonSet *ps) {
  printf("{\n");
  for (int i = 0; i < ps->size; i++) {
    Person *p = ps->array[i];
    PersonPrintf(p, ";\n");
  }
  printf("}(size=%d, capacity=%d)\n", ps->size, ps->capacity);
}

// Find index in ps->array of person with given id.
// (INTERNAL function.)
static int search(const PersonSet *ps, int id) {
  for (int i = 0; i < ps->size; i++) {
    if (PersonGetId(ps->array[i]) == id) {
      return i;
    }
  }
  return -1;
}

// Append person *p to *ps, without verifying presence.
// Use only when sure that *p is not contained in *ps!
// (INTERNAL function.)
static void append(PersonSet *ps, Person *p) {
  if (ps->size == ps->capacity) {
    ps->capacity *= 2;
    Person **newArray = (Person **)realloc(ps->array, sizeof(Person *) * ps->capacity);
    if (newArray == NULL) {
      return;
    }
    ps->array = newArray;
  }

  ps->array[ps->size] = p;
  ps->size++;
}

// Add person *p to *ps.
// Do nothing if *ps already contains a person with the same id.
void PersonSetAdd(PersonSet *ps, Person *p) {
  if (search(ps, PersonGetId(p)) == -1) {
    append(ps, p);
  }
}

// Pop one person out of *ps.
Person *PersonSetPop(PersonSet *ps) {
  assert(!PersonSetIsEmpty(ps));
  Person *p = ps->array[ps->size - 1];
  ps->size--;
  return p;
}

// Remove the person with given id from *ps, and return it.
// If no such person is found, return NULL and leave set untouched.
Person *PersonSetRemove(PersonSet *ps, int id) {
  int index = search(ps, id);
  if (index == -1) {
    return NULL;
  }
  Person *p = ps->array[index];
  for (int i = index; i < ps->size - 1; i++) {
    ps->array[i] = ps->array[i + 1];
  }
  ps->size--;
  return p;
}

// Get the person with given id of *ps.
// return NULL if it is not in the set.
Person *PersonSetGet(const PersonSet *ps, int id) {
  int index = search(ps, id);
  if (index == -1) {
    return NULL;
  }
  return ps->array[index];
}

// Return true (!= 0) if set contains person with given id, false otherwise.
int PersonSetContains(const PersonSet *ps, int id) {
  return search(ps, id) >= 0;
}

// Return a NEW PersonSet with the union of *ps1 and *ps2.
// Return NULL if allocation fails.
// NOTE: memory is allocated.  Client must call PersonSetDestroy!
PersonSet *PersonSetUnion(const PersonSet *ps1, const PersonSet *ps2) {
  PersonSet *ps = PersonSetCreate();
  if (ps == NULL) {
    return NULL;
  }

  for (int i = 0; i < ps1->size; i++) {
    Person *newPerson = PersonClone(ps1->array[i]);
    if (newPerson == NULL) {
      PersonSetDestroy(&ps);
      return NULL;
    }
    append(ps, newPerson);
  }

  for (int i = 0; i < ps2->size; i++) {
    if (!PersonSetContains(ps, PersonGetId(ps2->array[i]))) {
      Person *newPerson = PersonClone(ps2->array[i]);
      if (newPerson == NULL) {
        PersonSetDestroy(&ps);
        return NULL;
      }
      append(ps, newPerson);
    }
  }

  return ps;
}

// Return a NEW PersonSet with the intersection of *ps1 and *ps2.
// Return NULL if allocation fails.
// NOTE: memory is allocated.  Client must call PersonSetDestroy!
PersonSet *PersonSetIntersection(const PersonSet *ps1, const PersonSet *ps2) {
  PersonSet *ps = PersonSetCreate();
  if (ps == NULL) {
    return NULL;
  }

  for (int i = 0; i < ps1->size; i++) {
    if (PersonSetContains(ps2, PersonGetId(ps1->array[i]))) {
      Person *newPerson = PersonClone(ps1->array[i]);
      if (newPerson == NULL) {
        PersonSetDestroy(&ps);
        return NULL;
      }
      append(ps, newPerson);
    }
  }

  return ps;
}

// Return a NEW PersonSet with the set difference of *ps1 and *ps2.
// Return NULL if allocation fails.
// NOTE: memory is allocated.  Client must call PersonSetDestroy!
PersonSet *PersonSetDifference(const PersonSet *ps1, const PersonSet *ps2) {
  PersonSet *ps = PersonSetCreate();
  if (ps == NULL) {
    return NULL;
  }

  for (int i = 0; i < ps1->size; i++) {
    if (!PersonSetContains(ps2, PersonGetId(ps1->array[i]))) {
      Person *newPerson = PersonClone(ps1->array[i]);
      if (newPerson == NULL) {
        PersonSetDestroy(&ps);
        return NULL;
      }
      append(ps, newPerson);
    }
  }

  return ps;
}

// Return true iff *ps1 is a subset of *ps2.
int PersonSetIsSubset(const PersonSet *ps1, const PersonSet *ps2) {
  for (int i = 0; i < ps1->size; i++) {
    if (!PersonSetContains(ps2, PersonGetId(ps1->array[i]))) {
      return 0;
    }
  }
  return 1;
}

// Return true if the two sets contain exactly the same elements.
int PersonSetEquals(const PersonSet *ps1, const PersonSet *ps2) {
  if (ps1->size != ps2->size) {
    return 0;
  }
  return PersonSetIsSubset(ps1, ps2) && PersonSetIsSubset(ps2, ps1);
}