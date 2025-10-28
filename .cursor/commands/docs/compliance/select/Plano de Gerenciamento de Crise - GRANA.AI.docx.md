# **Plano de Gerenciamento de Crise (CMP) – GRANA.AI**

Versão: 1.0

Data: 09 de outubro de 2025

## **1\. Objetivo**

O Plano de Gerenciamento de Crise (CMP) estabelece diretrizes, responsabilidades e fluxos de comunicação a serem seguidos em caso de incidentes críticos ou interrupções graves que impactem a operação da GRANA.AI e seus clientes, especialmente o contrato com a Serasa Experian. O objetivo é assegurar uma resposta coordenada, rápida e eficaz, garantindo comunicação transparente e redução do tempo de indisponibilidade.

## **2\. Definição de Crise**

A Select classifica como crise todo incidente que impacte diretamente o ambiente produtivo de um cliente, resultando em:

* • Indisponibilidade total ou parcial do serviço;  
* • Lentidão significativa em sistemas críticos;  
* • Falhas de autenticação ou erros generalizados de acesso;  
* • Ocorrências que afetem a integridade ou continuidade do negócio.

Todo incidente crítico deve ser tratado como Crise Operacional, acionando o fluxo de gestão descrito neste plano.

## **3\. Canais de Atuação e Pontos de Contato**

| Função | Responsável | Contato / Canal | Observações |
| :---- | :---- | :---- | :---- |
| Cliente (Serasa Experian) | Ponto focal técnico | Canal direto via grupo de incidentes críticos | Recebe notificações e atualizações a cada 30 min |
| Especialista SR / SRE | Time de Sustentação | Slack \#incidente\_critico | Diagnóstico e execução técnica |
| SDM / Service Delivery Manager | Select Operações | Slack \#incidente\_critico | Acompanha SLA e status de escalonamento |
| CTO / CIO (Select) | Direção Técnica | Slack / SMS de Crise | Intervenção executiva e reporte ao cliente |
| NOC 24x7 / Plantão | Monitoramento | Canal interno Zabbix / Telefone Plantão | Primeira linha de detecção e acionamento |

## **4\. Procedimento de Resposta a Crise**

1\. Detecção e Classificação:

• Identificação de falha crítica em ambiente produtivo via Zabbix, CloudWatch ou reporte do cliente.

• Classificação imediata como Incidente Crítico / Crise.

2\. Abertura e Comunicação Inicial:

• Abertura de ticket no ITSM Select (categoria “Incidente Crítico”).

• Criação imediata de sala de guerra (Slack \#incidente\_critico) com os envolvidos.

• Comunicação inicial ao cliente conforme modelo:

Cliente – Incidente aberto – ambiente \[X\] indisponível, equipes técnicas atuando. Previsão do próximo status: 30 minutos.

3\. Ciclo de Comunicação:

• Atualizações a cada 30 minutos via slack de Crise e grupo de comunicação do cliente.

• Uso da tabela de comunicação para status, previsão e escalonamentos.

4\. Escalonamento:

• Após 30 min: acionar Especialista SR.

• Após 60 min: acionar Tech Lead e SDM.

• Após 90 min: acionar CTO.

• Após 120 min: escalar para CIO.

5\. Resolução e Encerramento:

Após restabelecimento do ambiente, comunicar encerramento formal no grupo do cliente conforme modelo padrão:

🚨 \[INCIDENTE CRÍTICO RESOLVIDO\] 🚨  
🕒 Início: 08h30  
🕒 Solução Iniciada: 08h45  
🕒 Finalização: 09h04  
🔧 Solução: \[Resumo técnico\]  
📞 Status: Sistema estabilizado e monitorado.

## **5\. Tabela de Comunicação de Incidentes Críticos**

| Tempo | Mensagem | Interno (Select) | Cliente | Canal | Canal Interno |
| :---- | :---- | :---- | :---- | :---- | :---- |
| Início | Incidente aberto – ambiente XPTO indisponível, equipes atuando. | SDM, Especialista SR | Tech Lead | Grupo do cliente | Slack \#incidente\_critico |
| 30 min | Incidente em andamento – equipes atuando. Próximo status: 30 min. | SDM, Tech Lead, CTO | Tech Lead, CTO | Grupo do cliente | Slack \#incidente\_critico |
| 1h | Incidente em andamento – previsão de restabelecimento 99 min. | SDM, Tech Lead, CTO | Tech Lead, CTO | Grupo do cliente | Slack \#incidente\_critico |
| 1h30 | Repetir comunicação com novo status | SDM, CTO, CIO | Tech Lead, CTO | Grupo do cliente | Slack \#incidente\_critico |
| Fim | Incidente encerrado – ambiente restabelecido com sucesso. | SDM, CTO, CIO | Tech Lead, CTO | Grupo do cliente | Slack \#incidente\_critico |

## **6\. Pós-Crise (Post-Mortem / Laudo de Problema)**

Após o encerramento do incidente crítico, é obrigatória a elaboração de um Laudo de Problema (LP) seguindo o modelo institucional da Select. O LP deve conter: descrição do incidente, impacto e duração, causa raiz e fatores contribuintes, ações corretivas e preventivas, lições aprendidas e recomendações. O documento deve ser armazenado no SharePoint da Select e vinculado ao ticket original no ITSM.

## **7\. Ferramentas de Apoio**

* • Select ITSM (GLPI): Registro, acompanhamento e comunicação de incidentes;  
* • Zabbix / CloudWatch: Detecção e monitoramento proativo;  
* • Slack (\#incidente\_critico): Coordenação e comunicação interna;  
* • Email / SMS de Crise: Comunicação externa com cliente;  
* • Terraform / GitLab / GetStart: Atuação técnica e correção em infraestrutura;  
* • SharePoint: Repositório de LPs (pós-mortem).

## **8\. Revisão e Testes**

• Periodicidade de Teste: Simulações de crise e exercícios de escalonamento a cada 6 meses.

• Revisão: Sempre que houver atualização de times, ferramentas ou processos.

• Evidências: Logs, relatórios e atas de reuniões de crise arquivados no SharePoint.

## **9\. Conclusão**

Este plano garante que a Select Soluções e a GRANA.AI possuam um processo estruturado de resposta a crises, com fluxos claros de comunicação e escalonamento, assegurando a pronta atuação em incidentes críticos e transparência total junto à Serasa Experian.