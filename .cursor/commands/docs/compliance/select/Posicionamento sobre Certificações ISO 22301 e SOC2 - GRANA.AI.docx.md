# **Posicionamento sobre Certificações ISO 22301 e Relatórios SOC 2 – GRANA.AI**

Versão: 1.0

Data: 09 de outubro de 2025

Responsável:

## **1\. Contexto**

A GRANA.AI, em parceria com a Select Soluções, mantém um conjunto de práticas, políticas e planos voltados à continuidade de negócios, segurança da informação e resiliência operacional. Embora ainda não possua certificação ISO 22301 ou relatório SOC 2 emitido formalmente, a empresa adota controles, processos e ferramentas em conformidade com os princípios e requisitos técnicos dessas normas internacionais.

## **2\. Alinhamento com a Norma ISO 22301**

A norma ISO 22301:2019 – Sistema de Gestão de Continuidade de Negócios (SGCN) define requisitos para planejar, estabelecer e manter um sistema que assegure a operação de serviços críticos em situações de crise. Os processos da GRANA.AI estão em conformidade parcial e progressiva com os seguintes eixos da ISO 22301:

| Requisito ISO 22301 | Prática Implementada | Situação Atual |
| :---- | :---- | :---- |
| Análise de Impacto nos Negócios (BIA) | Identificação dos serviços críticos em AWS (ECS, EC2, RDS) e respectivos RTO/RPO definidos. | Implementado |
| Plano de Continuidade de Negócios (BCP) | Documento formal revisado semestralmente, abrangendo processos e responsabilidades. | Implementado |
| Plano de Recuperação de Desastres (DRP) | Procedimentos documentados para restauração de serviços e dados. | Implementado |
| Gerenciamento de Crise e Comunicação | Plano de Crise com fluxo de escalonamento e comunicação com cliente (Serasa Experian). | Implementado |
| Testes e Simulações | Estruturação do ciclo anual de testes (fase de implantação). | Em implantação |
| Treinamentos e Conscientização | Workshops internos sobre resiliência e resposta a incidentes. | Em implantação |
| Melhoria Contínua e Revisões | Revisão de planos a cada seis meses. | Implementado |

## **3\. Alinhamento com o Relatório SOC 2**

O SOC 2 (System and Organization Controls) avalia controles de segurança, disponibilidade, confidencialidade, integridade e privacidade. A Select Soluções / GRANA.AI adota controles baseados nesses cinco princípios de confiança, conforme descrito abaixo:

| Princípio SOC 2 | Práticas Adotadas | Status |
| :---- | :---- | :---- |
| Segurança | Uso de autenticação multifator (MFA), VPN, segregação de ambientes e controle de acesso IAM. | Implementado |
| Disponibilidade | Infraestrutura na AWS com SLA ≥ 99,9%, monitoramento 24x7 via Zabbix e CloudWatch. | Implementado |
| Integridade de Processamento | Automação via pipelines (Terraform, CodePipeline, ECS) com logs auditáveis. | Implementado |
| Confidencialidade | Criptografia de dados em trânsito e repouso (TLS 1.2 / KMS). | Implementado |
| Privacidade | Gestão de acessos conforme LGPD, com logs centralizados e política de segurança. | Em conformidade parcial |

## **4\. Plano de Certificação**

A Select Soluções mantém um plano de adequação e certificação com as seguintes etapas:

| Etapa | Descrição | Situação Atual |
| :---- | :---- | :---- |
| Diagnóstico de Maturidade ISO 22301 / SOC 2 | Avaliação de lacunas e priorização de controles. | Concluído |
| Implantação de Melhorias Operacionais | Ajustes em processos e registros de testes de continuidade. | Em andamento |
| Auditoria Interna e Validação | Testes e simulações documentadas de DRP e BCP. | Planejado |
| Engajamento de Auditor Externo | Contratação de consultoria especializada para certificação ISO 22301 / SOC 2\. | Planejado para 2026 |

## **5\. Conclusão**

A GRANA.AI e a Select Soluções reafirmam o compromisso com a resiliência de negócios, a continuidade operacional e a adoção progressiva de normas internacionais de governança e segurança da informação. O processo de certificação ISO 22301 e SOC 2 encontra-se em fase de implantação e amadurecimento, refletindo o avanço contínuo do programa de conformidade corporativa.