//
// Algoritmos e Estruturas de Dados --- 2024/2025
//
// Joaquim Madeira - Dec 2024
//
// GraphBellmanFord - Bellman-Ford Algorithm
//

// Student Name : Gabriel Lameira Marta
// Student Number : 120155
// Student Name : Tiago Pita
// Student Number : 120152

/*** COMPLETE THE GraphBellmanFordAlgExecute FUNCTION ***/

#include "GraphBellmanFordAlg.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "Graph.h"
#include "IntegersStack.h"
#include "instrumentation.h"
#include "SortedList.h"

#define INFINITY 2147483647 // Definindo um valor grande para representar infinito

struct _GraphBellmanFordAlg {
  int* marked;  // To mark vertices when reached for the first time
  int* distance;  // The number of edges on the path from the start vertex
                  // distance[i]=-1, if no path found from the start vertex to i
  int* predecessor;  // The predecessor vertex in the shortest path
                     // predecessor[i]=-1, if no predecessor exists
  Graph* graph;
  unsigned int startVertex;  // The root of the shortest-paths tree
};

GraphBellmanFordAlg *GraphBellmanFordAlgExecute(Graph *g, unsigned int startVertex)
{
  assert(g != NULL);
  assert(startVertex < GraphGetNumVertices(g));

  unsigned int numVertices = GraphGetNumVertices(g);
  GraphBellmanFordAlg *result = (GraphBellmanFordAlg *)malloc(sizeof(GraphBellmanFordAlg));
  assert(result != NULL);

  result->graph = g;
  result->startVertex = startVertex;

  // Alocação contígua para otimização de memória
  size_t total_size = numVertices * (sizeof(int) + sizeof(int) * 2);
  void *block = malloc(total_size);
  if (!block)
  {
    // Tratamento de erro de alocação - liberar memória e retornar NULL
    free(result);
    return NULL;
  }

  result->marked = (int *)block;
  result->distance = (int *)(block + numVertices * sizeof(int));
  result->predecessor = (int *)(block + numVertices * (sizeof(int) + sizeof(int)));

  for (unsigned int i = 0; i < numVertices; i++)
  {
    result->marked[i] = 0;
    result->distance[i] = INFINITY; // Inicializa com infinito
    result->predecessor[i] = -1;
  }

  result->distance[startVertex] = 0;
  result->marked[startVertex] = 1;

  // Relaxamento das arestas |V|-1 vezes
  for (unsigned int i = 1; i < numVertices; i++)
  {
    for (unsigned int u = 0; u < numVertices; u++)
    {
      unsigned int numAdj = GraphGetVertexOutDegree(g, u);
      unsigned int *adj = GraphGetAdjacentsTo(g, u);

      for (unsigned int j = 1; j <= numAdj; j++)
      {
        unsigned int v = adj[j];
        int weight = 1; // Peso 1 para grafos não ponderados.
                        // Se for ponderado, obter o peso da aresta aqui.

        if (result->distance[u] != INFINITY && result->distance[u] + weight < result->distance[v])
        {
          result->distance[v] = result->distance[u] + weight;
          result->predecessor[v] = u;
          result->marked[v] = 1;
        }
      }
    }
  }

  // Detectar ciclos negativos (opcional, importante para grafos ponderados)
  for (unsigned int u = 0; u < numVertices; u++)
  {
    unsigned int numAdj = GraphGetVertexOutDegree(g, u);
    unsigned int *adj = GraphGetAdjacentsTo(g, u);

    for (unsigned int j = 1; j <= numAdj; j++)
    {
      unsigned int v = adj[j];
      int weight = 1; // Obter o peso se o grafo for ponderado

      if (result->distance[u] != INFINITY && result->distance[u] + weight < result->distance[v])
      {
        // Ciclo negativo encontrado! Tratar o erro apropriadamente.
        // (e.g., retornar NULL, imprimir mensagem de erro, etc.)
        fprintf(stderr, "Negative cycle detected!\n");
        GraphBellmanFordAlgDestroy(&result); // Liberar memória
        return NULL;
      }
    }
  }

  return result;
}

void GraphBellmanFordAlgDestroy(GraphBellmanFordAlg** p) {
  assert(*p != NULL);

  GraphBellmanFordAlg* aux = *p;

  if (aux->marked) {
    free(aux->marked); // marked, distance e predecessor foram alocados juntos
  }

  free(aux);
  *p = NULL;
}

// Getting the paths information

int GraphBellmanFordAlgReached(const GraphBellmanFordAlg* p, unsigned int v) {
  assert(p != NULL);
  assert(v < GraphGetNumVertices(p->graph));

  return p->marked[v];
}

int GraphBellmanFordAlgDistance(const GraphBellmanFordAlg* p, unsigned int v) {
  assert(p != NULL);
  assert(v < GraphGetNumVertices(p->graph));

  return p->distance[v];
}
Stack* GraphBellmanFordAlgPathTo(const GraphBellmanFordAlg* p, unsigned int v) {
  assert(p != NULL);
  assert(v < GraphGetNumVertices(p->graph));

  Stack* s = StackCreate(GraphGetNumVertices(p->graph));

  if (p->marked[v] == 0) {
    return s;
  }

  // Store the path
  for (unsigned int current = v; current != p->startVertex;
       current = p->predecessor[current]) {
    StackPush(s, current);
  }

  StackPush(s, p->startVertex);

  return s;
}

// DISPLAYING on the console

void GraphBellmanFordAlgShowPath(const GraphBellmanFordAlg* p, unsigned int v) {
  assert(p != NULL);
  assert(v < GraphGetNumVertices(p->graph));

  Stack* s = GraphBellmanFordAlgPathTo(p, v);

  while (StackIsEmpty(s) == 0) {
    printf("%d ", StackPop(s));
  }

  StackDestroy(&s);
}

// Display the Shortest-Paths Tree in DOT format
void GraphBellmanFordAlgDisplayDOT(const GraphBellmanFordAlg* p) {
  assert(p != NULL);

  Graph* original_graph = p->graph;
  unsigned int num_vertices = GraphGetNumVertices(original_graph);

  // The paths tree is a digraph, with no edge weights
  Graph* paths_tree = GraphCreate(num_vertices, 1, 0);

  // Use the predecessors array to add the tree edges
  for (unsigned int w = 0; w < num_vertices; w++) {
    // Vertex w has a predecessor vertex v?
    int v = p->predecessor[w];
    if (v != -1) {
      GraphAddEdge(paths_tree, (unsigned int)v, w);
    }
  }

  // Display the tree in the DOT format
  GraphDisplayDOT(paths_tree);

  // Housekeeping
  GraphDestroy(&paths_tree);
}