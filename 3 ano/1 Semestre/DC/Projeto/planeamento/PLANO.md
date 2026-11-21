# Plano do projeto EcoNode

## 1. Objetivo
Nota 20/20 com um projeto **simples, modular e bem organizado**, que ambos sabemos explicar linha a linha.

## 2. Como somos avaliados
Projeto = 80% da componente prática (50% da nota da UC).

| Componente | Peso no projeto | O que conta |
|---|---|---|
| Progresso semanal no GitHub | 25% | Uma entrada por semana no README, a tempo e no formato certo |
| Documentação entregue | 25% | README, ADRs, evidências, código legível |
| Defesa oral (sem IA) | 50% | Apresentação, demo, resposta a perguntas. **Quem faltar tem 0** |

Critérios do código/doc: cumprimento dos requisitos, conceção técnica, compreensão e documentação, inovação/complexidade.

## 3. Dados do grupo
| Parâmetro | Valor |
|---|---|
| Grupo / turma | 10 / P1 (T = 1) |
| NMEC | 120152, 126036 |
| S (soma dos algarismos) | 11 + 18 = 29 → D = 9 |
| `node_id` | 1000 + 10×1 + 9 = **1019** (hex `03FB`) |
| Tópicos de telemetria | `econode/1019/` |
| UUID base do serviço de config | `E0C0DE00-0000-4000-8000-0000000003FB` (características `E0C0DE01-…`, `E0C0DE02-…`) |
| Mecanismo da tarefa de aquisição | **Message Buffer** (sorteado) |

Estes valores têm de estar no ficheiro de configuração JSON e aparecer no TFT no arranque.

## 4. Regras técnicas que não podemos esquecer
- **Modular (RNF7):** cada módulo em `components/<nome>/` com interface pública em `include/<nome>.h`. Módulos que consomem dados **não se incluem uns aos outros** (ex.: o ecrã não inclui nada da rede).
- **Uma tarefa FreeRTOS por funcionalidade**, nenhuma bloqueia outra (RNF1).
- **Configuração:** só através da interface pública do módulo de config. Nenhum módulo copia valores para variáveis locais no arranque.
- **Versões de formato:** campo de versão na telemetria, no CSV e nas características GATT proprietárias; `config_version` no JSON.
- **Telemetria:** servidor dado como URI completo (`mqtt://…` ou `ws://…`), trocável só pelo JSON.
- **Segurança (RNF6):** credenciais nunca no ecrã nem no log; características BLE que as recebem não são legíveis.
- **Build:** ESP-IDF **v6.1.0**, `idf.py build` num clone limpo sem passos manuais, dependências em `main/idf_component.yml`, `dependencies.lock` no git.
- **Message Buffer:** documentar o tamanho escolhido (com contas) e o que acontece quando enche. É pergunta certa na defesa.
- **ADRs:** mínimo 5, datados, em `docs/adr/`, com alternativas consideradas.

## 5. Cronograma
Entregas do log até **sexta-feira** de cada semana (a semana 1 foi estendida para 30/10). Confirmar datas no eLearning. Aulas práticas P1 à sexta: BLE 23/10 e 30/10, consumo 6/11, protocolos IP 13/11, segurança/OTA 20/11, interfaces gráficas 27/11.

| Semana | Entrega | Objetivo da semana (detalhe por pessoa em [DIVISAO.md](DIVISAO.md)) |
|---|---|---|
| 1 | 30/10 | Setup do repo, contratos entre módulos, primeiros ADRs, config + Wi-Fi |
| 2 | 6/11 | microSD + tarefa DHT20 com Message Buffer · telemetria `mqtt://` |
| 3 | 13/11 | TFT + SPI partilhado · `ws://` + tolerância a falhas · dashboard |
| 4 | 20/11 | LED RGB + potenciómetro · BLE Environmental Sensing |
| 5 | 27/11 | Robustez local · serviço GATT de config + provisionamento |
| 6 | 4/12 | Consumo energético · validação de tudo · evidências · extras |
| — | 10–18/12 | Defesa (ensaiar demo, slides, perguntas cruzadas) |
| — | 22/12 | **Devolver o kit** (senão não há nota para nenhum dos dois) |

## 6. Regras do log semanal (README do repo)
1. Uma entrada por semana, acrescentada ao **fim** da secção "Registo de progresso semanal".
2. Commit **só com essa entrada**, mensagem exatamente `log: semana N`, com tag `semana-N`:
   ```bash
   git add README.md
   git commit -m "log: semana N"
   git tag semana-N
   git push && git push origin semana-N
   ```
3. **Nunca** editar entradas de semanas anteriores (o histórico é verificado). A tabela de requisitos pode e deve ser atualizada.
4. Todas as alíneas preenchidas (modelo em `docs/templates/semana.md`), incluindo a divisão de trabalho **por NMEC** e a **utilização de IA** (omitir é falta de integridade académica).
5. Curto e focado: é um registo, não um relatório.
6. Estados da tabela: `não iniciado`, `em curso`, `funcional`, `validado` — `validado` só com evidência em `docs/evidences/`.

## 7. Regras do git
- Commits diretos no branch `master` (é o branch do repo oficial). Fazer `git pull` antes de começar e antes de fazer push.
- Commits pequenos, mensagem em PT a dizer o quê (ex.: `config: leitura do JSON do cartão`).
- Cada um trabalha sobretudo na pasta do seu módulo, para evitar conflitos. Ficheiros partilhados (`main/main.c`, README) — avisar o outro antes.
- **Nunca** fazer commit de: `.claude/`, `CLAUDE.md`, esta pasta `planeamento/`, `build/`, `sdkconfig`, `managed_components/`, credenciais reais de Wi-Fi.

## 8. Checklist para 20/20
- [ ] Compila num clone limpo com ESP-IDF v6.1.0
- [ ] `dependencies.lock` no repo
- [ ] Tarefa de aquisição usa Message Buffer; dimensionamento e "buffer cheio" documentados
- [ ] node_id, tópicos e UUID no JSON e no ecrã de arranque
- [ ] `mqtt://` e `ws://` trocam-se só pelo JSON
- [ ] Campo de versão em telemetria, CSV, GATT; `config_version` no JSON
- [ ] Nenhum módulo copia a configuração
- [ ] Credenciais fora do ecrã, do log e de características BLE legíveis
- [ ] Sem `#include` cruzados entre módulos consumidores
- [ ] Sem Wi-Fi/broker: amostragem, SD e BLE continuam (com evidência)
- [ ] ≥ 5 ADRs datados
- [ ] Evidência para cada requisito `validado`
- [ ] 6 entradas de log, a tempo, formato e tags certos, nenhuma editada
- [ ] Demo pronta: dashboard em tempo real + nRF Connect/LightBlue
- [ ] Ambos sabem explicar todo o código (sessões semanais de explicação mútua)
