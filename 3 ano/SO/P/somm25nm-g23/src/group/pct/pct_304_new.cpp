/*
 *  \author Daniel Oliveira 115359
 */

#include "pct.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    uint16_t pctNew(uint32_t jid)
    {
        // Verificar se o módulo está aberto
        if (pctTable == PCT_UNDEF_TABLE || pctTable == nullptr)
            throw Exception(EINVAL, __func__);

        // Limites de PID
        uint16_t firstPid = pctPidBase;
        uint16_t maxPid   = static_cast<uint16_t>(pctPidBase + pctPidCount); // último+1

        // Determinar ponto de partida para a busca circular
        uint16_t candidate = pctLastPid;
        if (candidate < firstPid || candidate >= maxPid)
            candidate = firstPid;
        else
            candidate = static_cast<uint16_t>(candidate + 1);

        bool found = false;

        // Tentar, no máximo, pctPidCount PIDs (uma volta completa)
        for (uint16_t tried = 0; tried < pctPidCount && !found; ++tried)
        {
            if (candidate >= maxPid)
                candidate = firstPid;

            uint16_t idx = static_cast<uint16_t>(candidate - pctPidBase);

            // Se a posição na tabela estiver livre, encontrou PID
            if (pctTable[idx] == nullptr)
            {
                found = true;
                break;
            }

            ++candidate;
        }

        if (!found)
            throw Exception(ENOSPC, __func__);   // Não há PIDs disponíveis

        // Alocar e inicializar nova entrada
        PctNode *node = new (std::nothrow) PctNode;
        if (node == nullptr)
            throw Exception(ENOMEM, __func__);

        node->jid     = jid;
        node->memAddr = PCT_UNDEF_ADDRESS;   // ainda sem memória atribuída
        node->state   = NEW;                 // estado inicial

        // Colocar o ponteiro na tabela
        uint16_t idx = static_cast<uint16_t>(candidate - pctPidBase);
        pctTable[idx] = node;

        // Atualizar último PID usado
        pctLastPid = candidate;

        // Devolver PID criado
        return candidate;
    }
} // end of namespace group
