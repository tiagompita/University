//
// Algoritmos e Estruturas de Dados --- 2024/2025
//
// Joaquim Madeira - Dec 2024
//
// GraphEccentricityMeasures
//

// Student Name : Tiago Pita
// Student Number : 120152
// Student Name : Gabriel Lameira Marta
// Student Number : 120155

/*** COMPLETE THE GraphEccentricityMeasuresCompute FUNCTION ***/
/*** COMPLETE THE GraphGetCentralVertices FUNCTION ***/
/*** COMPLETE THE GraphEccentricityMeasuresPrint FUNCTION ***/

#include "GraphEccentricityMeasures.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "Graph.h"
#include "GraphAllPairsShortestDistances.h"

#define INFINITY 2147483647  // Definindo um valor grande para representar infinito

// Estrutura para armazenar as medidas de excentricidade do grafo
struct _GraphEccentricityMeasures {
  unsigned int* centralVertices;  // centralVertices[0] = número de vértices centrais
                                  // tamanho do array é (número de vértices centrais + 1)
  int* eccentricity;              // valor da excentricidade de cada vértice
  Graph* graph;                   // o grafo
  int graphRadius;                // o raio do grafo
  int graphDiameter;              // o diâmetro do grafo
};

// Alocar memória
// Calcular os valores de excentricidade dos vértices
// Calcular o raio e o diâmetro do grafo
// Calcular o conjunto de vértices centrais
GraphEccentricityMeasures* GraphEccentricityMeasuresCompute(Graph* g) {
  assert(g != NULL);

  unsigned int numVertices = GraphGetNumVertices(g);
  GraphEccentricityMeasures* result = (GraphEccentricityMeasures*)malloc(sizeof(GraphEccentricityMeasures));
  assert(result != NULL);

  result->graph = g;
  result->eccentricity = (int*)malloc(numVertices * sizeof(int));
  assert(result->eccentricity != NULL);

  // Executar o algoritmo de Bellman-Ford para calcular as distâncias mais curtas entre todos os pares de vértices
  GraphAllPairsShortestDistances* apsd = GraphAllPairsShortestDistancesExecute(g);
  assert(apsd != NULL);

  int radius = INFINITY;  // Inicializa o raio com infinito
  int diameter = -1;      // Inicializa o diâmetro com -1

  // Calcular a excentricidade para cada vértice
  for (unsigned int v = 0; v < numVertices; v++) {
    int maxDistance = -1;
    for (unsigned int w = 0; w < numVertices; w++) {
      int distance = GraphGetDistanceVW(apsd, v, w);
      if (distance != -1 && distance > maxDistance) {
        maxDistance = distance;
      }
    }
    result->eccentricity[v] = maxDistance;
    if (maxDistance < radius) {
      radius = maxDistance;
    }
    if (maxDistance > diameter) {
      diameter = maxDistance;
    }
  }

  result->graphRadius = radius;      // Define o raio do grafo
  result->graphDiameter = diameter;  // Define o diâmetro do grafo

  // Calcular o conjunto de vértices centrais
  unsigned int numCentralVertices = 0;
  for (unsigned int v = 0; v < numVertices; v++) {
    if (result->eccentricity[v] == radius) {
      numCentralVertices++;
    }
  }

  result->centralVertices = (unsigned int*)malloc((numCentralVertices + 1) * sizeof(unsigned int));
  assert(result->centralVertices != NULL);
  result->centralVertices[0] = numCentralVertices;

  unsigned int index = 1;
  for (unsigned int v = 0; v < numVertices; v++) {
    if (result->eccentricity[v] == radius) {
      result->centralVertices[index++] = v;
    }
  }

  // Destruir a estrutura de distâncias mais curtas
  GraphAllPairsShortestDistancesDestroy(&apsd);

  return result;
}

// Função para destruir a estrutura de medidas de excentricidade
void GraphEccentricityMeasuresDestroy(GraphEccentricityMeasures** p) {
  assert(*p != NULL);

  GraphEccentricityMeasures* aux = *p;

  free(aux->centralVertices);
  free(aux->eccentricity);

  free(*p);
  *p = NULL;
}

// Obter o raio do grafo
int GraphGetRadius(const GraphEccentricityMeasures* p) {
  assert(p != NULL);

  return p->graphRadius;
}

// Obter o diâmetro do grafo
int GraphGetDiameter(const GraphEccentricityMeasures* p) {
  assert(p != NULL);

  return p->graphDiameter;
}

// Obter a excentricidade de um vértice específico
int GraphGetVertexEccentricity(const GraphEccentricityMeasures* p, unsigned int v) {
  assert(p != NULL);
  assert(v < GraphGetNumVertices(p->graph));
  assert(p->eccentricity != NULL);

  return p->eccentricity[v];
}

// Obter uma cópia do conjunto de vértices centrais
// centralVertices[0] = número de vértices centrais no conjunto
unsigned int* GraphGetCentralVertices(const GraphEccentricityMeasures* p) {
  assert(p != NULL);
  assert(p->centralVertices != NULL);

  unsigned int numCentralVertices = p->centralVertices[0];
  unsigned int* centralVerticesCopy = (unsigned int*)malloc((numCentralVertices + 1) * sizeof(unsigned int));
  assert(centralVerticesCopy != NULL);

  for (unsigned int i = 0; i <= numCentralVertices; i++) {
    centralVerticesCopy[i] = p->centralVertices[i];
  }

  return centralVerticesCopy;
}

// Imprimir o raio e o diâmetro do grafo
// Imprimir os valores de excentricidade dos vértices
// Imprimir o conjunto de vértices centrais
void GraphEccentricityMeasuresPrint(const GraphEccentricityMeasures* p) {
  assert(p != NULL);

  printf("Graph Radius: %d\n", p->graphRadius);
  printf("Graph Diameter: %d\n", p->graphDiameter);

  unsigned int numVertices = GraphGetNumVertices(p->graph);
  printf("Vertex Eccentricities:\n");
  for (unsigned int v = 0; v < numVertices; v++) {
    printf("Vertex %u: %d\n", v, p->eccentricity[v]);
  }

  unsigned int numCentralVertices = p->centralVertices[0];
  printf("Central Vertices (total %u):\n", numCentralVertices);
  for (unsigned int i = 1; i <= numCentralVertices; i++) {
    printf("Vertex %u\n", p->centralVertices[i]);
  }
}