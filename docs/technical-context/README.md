# 🏗️ Technical Context - Acme Fintech Inc

Visão geral da arquitetura, infraestrutura e stack técnico.

## 📖 Índice

1. [Architecture](#architecture)
2. [Infrastructure Overview](#infrastructure-overview)
3. [Stack Summary](#stack-summary)

## 🏛️ Architecture

**Padrão**: Microserviços em Kubernetes  
**Cloud Provider**: AWS (us-east-1)  
**Container Runtime**: Docker  
**Orquestração**: Kubernetes (EKS)  

## ☁️ Infrastructure Overview

**Cloud Provider**: AWS  
**Região**: us-east-1  

**Serviços**:
- **Compute**: EC2
- **Database**: RDS PostgreSQL
- **Cache**: ElastiCache Redis
- **Container**: Docker
- **Orquestração**: Kubernetes (EKS)
- **CI/CD**: GitHub Actions
- **Secret Management**: AWS Secrets Manager
- **Monitoring**: CloudWatch + DataDog

## 💻 Stack Summary

**Linguagens**:
- Python 3.11
- JavaScript ES2020
- Go 1.21

**Frameworks**:
- Django 4.2
- React 18.2
- FastAPI 0.104

**Banco de Dados**:
- PostgreSQL 15
- Redis 7.0

**CI/CD**:
- GitHub Actions
- ArgoCD

**Observabilidade**:
- Prometheus
- Grafana
- ELK Stack

**Messaging**: RabbitMQ  
**Versionamento**: Git + GitHub

---

Veja documentos relacionados: [ARCHITECTURE.md](ARCHITECTURE.md) | [infrastructure-overview.md](infrastructure-overview.md) | [stack-summary.md](stack-summary.md)
