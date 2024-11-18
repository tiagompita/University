//
// Algoritmos e Estruturas de Dados --- 2024/2025
//
// Joaquim Madeira, Nov 2023, Nov 2024
//

// Complete the functions (marked by ...)
// so that they pass all tests.

#include "PersonSet.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "SortedList.h"

// NOTE THAT:
// - Field capacity was eliminated.
// - Field size was eliminated, because size==ListGetSize(...).

// Definition of the structure
struct _PersonSet_ {
  List *persons;  // points to a SortedList of Person pointers
};

// Comparison function to be used in generic SortedList.
// Comparison is based on Person ID
static int cmpP(const void *a, const void *b) {
  Person *p1 = (Person *)a;
  Person *p2 = (Person *)b;
  int d = p1->id - p2->id;
  return (d > 0) - (d < 0);
}

// Create a PersonSet.
PersonSet *PersonSetCreate() {
  PersonSet *set = (PersonSet *)malloc(sizeof(PersonSet));
  if (set == NULL) {
    return NULL;
  }
  set->persons = ListCreate(cmpP);
  if (set->persons == NULL) {
    free(set);
    return NULL;
  }
  return set;
}

// Destroy PersonSet *pps
void PersonSetDestroy(PersonSet **pps) {
  assert(*pps != NULL);
  ListClear((*pps)->persons);
  ListDestroy(&(*pps)->persons);
  free(*pps);
  *pps = NULL;
}

int PersonSetSize(const PersonSet *ps) { return ListGetSize(ps->persons); }

int PersonSetIsEmpty(const PersonSet *ps) { return ListIsEmpty(ps->persons); }

void PersonSetPrint(const PersonSet *ps) {
  printf("{\n");
  for (ListMoveToHead(ps->persons); ListCurrentIsInside(ps->persons);
       ListMoveToNext(ps->persons)) {
    Person *p = (Person *)ListGetCurrentItem(ps->persons);
    PersonPrintf(p, ";\n");
  }
  printf("}(size=%d)\n", PersonSetSize(ps));
  ListTestInvariants(ps->persons);
}

// Find node in list ps->persons of person with given id.
// (INTERNAL function.)
static int search(const PersonSet *ps, int id) {
  Person dummyperson;
  dummyperson.id = id;
  return ListSearch(ps->persons, &dummyperson);
}

// Add person *p to *ps.
// Do nothing if *ps already contains a person with the same id.
void PersonSetAdd(PersonSet *ps, Person *p) {
  if (search(ps, p->id) == -1) {
    ListInsert(ps->persons, p);
  }
}

// Pop one person out of *ps.
Person *PersonSetPop(PersonSet *ps) {
  assert(!PersonSetIsEmpty(ps));
  return (Person *)ListRemoveHead(ps->persons);
}

// Remove the person with given id from *ps, and return it.
// If no such person is found, return NULL and leave set untouched.
Person *PersonSetRemove(PersonSet *ps, int id) {
  int index = search(ps, id);
  if (index == -1) {
    return NULL;
  }
  ListMove(ps->persons, index);
  return (Person *)ListRemoveCurrent(ps->persons);
}

// Get the person with given id of *ps.
// return NULL if it is not in the set.
Person *PersonSetGet(const PersonSet *ps, int id) {
  int index = search(ps, id);
  if (index == -1) {
    return NULL;
  }
  ListMove(ps->persons, index);
  return (Person *)ListGetCurrentItem(ps->persons);
}

// Return true (!= 0) if set contains person wiht given id, false otherwise.
int PersonSetContains(const PersonSet *ps, int id) {
  return search(ps, id) >= 0;
}

// Return a NEW PersonSet with the union of *ps1 and *ps2.
// NOTE: memory is allocated.  Client must call PersonSetDestroy!
PersonSet *PersonSetUnion(const PersonSet *ps1, const PersonSet *ps2) {
  PersonSet *ps = PersonSetCreate();
  if (ps == NULL) {
    return NULL;
  }

  ListMoveToHead(ps1->persons);
  while (ListCurrentIsInside(ps1->persons)) {
    Person *p = (Person *)ListGetCurrentItem(ps1->persons);
    PersonSetAdd(ps, p);
    ListMoveToNext(ps1->persons);
  }

  ListMoveToHead(ps2->persons);
  while (ListCurrentIsInside(ps2->persons)) {
    Person *p = (Person *)ListGetCurrentItem(ps2->persons);
    PersonSetAdd(ps, p);
    ListMoveToNext(ps2->persons);
  }

  return ps;
}

// Return a NEW PersonSet with the intersection of *ps1 and *ps2.
// NOTE: memory is allocated.  Client must call PersonSetDestroy!
PersonSet *PersonSetIntersection(const PersonSet *ps1, const PersonSet *ps2) {
  PersonSet *ps = PersonSetCreate();
  if (ps == NULL) {
    return NULL;
  }

  ListMoveToHead(ps1->persons);
  while (ListCurrentIsInside(ps1->persons)) {
    Person *p = (Person *)ListGetCurrentItem(ps1->persons);
    if (PersonSetContains(ps2, p->id)) {
      PersonSetAdd(ps, p);
    }
    ListMoveToNext(ps1->persons);
  }

  return ps;
}

// Return a NEW PersonSet with the set difference of *ps1 and *ps2.
// NOTE: memory is allocated.  Client must call PersonSetDestroy!
PersonSet *PersonSetDifference(const PersonSet *ps1, const PersonSet *ps2) {
  PersonSet *ps = PersonSetCreate();
  if (ps == NULL) {
    return NULL;
  }

  ListMoveToHead(ps1->persons);
  while (ListCurrentIsInside(ps1->persons)) {
    Person *p = (Person *)ListGetCurrentItem(ps1->persons);
    if (!PersonSetContains(ps2, p->id)) {
      PersonSetAdd(ps, p);
    }
    ListMoveToNext(ps1->persons);
  }

  return ps;
}

// Return true iff *ps1 is a subset of *ps2.
int PersonSetIsSubset(const PersonSet *ps1, const PersonSet *ps2) {
  ListMoveToHead(ps1->persons);
  while (ListCurrentIsInside(ps1->persons)) {
    Person *p = (Person *)ListGetCurrentItem(ps1->persons);
    if (!PersonSetContains(ps2, p->id)) {
      return 0;
    }
    ListMoveToNext(ps1->persons);
  }
  return 1;
}

// Return true if the two sets contain exactly the same elements.
int PersonSetEquals(const PersonSet *ps1, const PersonSet *ps2) {
  return PersonSetSize(ps1) == PersonSetSize(ps2) &&
         PersonSetIsSubset(ps1, ps2);
}
