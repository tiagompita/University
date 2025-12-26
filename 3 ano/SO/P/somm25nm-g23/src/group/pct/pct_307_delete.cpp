/*
 *  \author Daniel Oliveira 115359
 */

#include "pct.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void pctDelete(uint16_t pid)
    {
        // módulo tem de estar aberto
        if (pctTable == PCT_UNDEF_TABLE || pctTable == nullptr)
            throw Exception(EINVAL, __func__);

        // verificar se pid está dentro do intervalo válido
        uint16_t first = pctPidBase;
        uint16_t max   = static_cast<uint16_t>(pctPidBase + pctPidCount); // último+1

        if (pid < first || pid >= max)
            throw Exception(EINVAL, __func__);

        // calcular índice na tabela
        uint16_t idx = static_cast<uint16_t>(pid - pctPidBase);

        // se não houver processo com esse pid, nada para libertar
        if (pctTable[idx] == nullptr)
            return;   // ou lançar Exception, se o enunciado o exigir

        // libertar o bloco de controlo do processo
        delete pctTable[idx];        // usa delete porque foi criado com new em pctNew
        pctTable[idx] = nullptr;     // marca a entrada como livre
    }
} // end of namespace group
