//
// Algoritmos e Estruturas de Dados --- 2024/2025
//
// Joaquim Madeira - Dec 2024
//
// GraphTransitiveClosure - Transitive Closure of a directed graph
//

// Student Name : Tiago Pita
// Student Number : 120152
// Student Name : Gabriel Lameira Marta
// Student Number : 120155

/*** COMPLETE THE GraphComputeTransitiveClosure FUNCTION ***/

#include "GraphTransitiveClosure.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "Graph.h"
#include "GraphBellmanFordAlg.h"
#include "instrumentation.h"

// Compute the transitive closure of a directed graph
// Return the computed transitive closure as a directed graph
// Use the Bellman-Ford algorithm
Graph *GraphComputeTransitiveClosure(Graph *g)
{
  assert(g != NULL);
  assert(GraphIsDigraph(g));
  assert(GraphIsWeighted(g) == 0);

  unsigned int numVertices = GraphGetNumVertices(g);
  Graph *transitiveClosure = GraphCreate(numVertices, 1, 0); // Directed, unweighted

  for (unsigned int u = 0; u < numVertices; u++)
  {
    GraphBellmanFordAlg *bf = GraphBellmanFordAlgExecute(g, u);

    if (bf == NULL)
    { // Handle potential errors in Bellman-Ford (e.g., negative cycles, although not expected here)
      fprintf(stderr, "Error: Bellman-Ford failed for vertex %u\n", u);
      GraphDestroy(&transitiveClosure);
      return NULL;
    }

    // Iterate through all other vertices
    for (unsigned int v = 0; v < numVertices; v++){
      // If vertex v is reachable from vertex u and u is not equal to v, add an edge
      if (u != v && GraphBellmanFordAlgReached(bf, v)) { 
        GraphAddEdge(transitiveClosure, u, v);
      }
    }
    GraphBellmanFordAlgDestroy(&bf);
  }

  return transitiveClosure;
}
