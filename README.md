# devsecops-netflix-clone




Currently still working on this repository to build a production-grade DevSecOps pipeline for a Netflix Clone.
The project provisions Azure Kubernetes Service (AKS) via Infrastructure-as-Code and deploys the containerized frontend using Helm charts.
Future enhancements include implementing automated CI/CD workflows, vulnerability scanning, and GitOps deployments with ArgoCD.

## Proposed Architecture

text
[ Developer ]
│
▼
[ GitHub Repository ]
│
├───> [ GitHub Actions CI/CD ] ───> [ Azure Container Registry (ACR) ]
│                                                     │
└──────────────────> [ ArgoCD ] <─────────────────────┘
│
▼
[ Azure Kubernetes Service (AKS) ]
│
[ Pods / Nginx UI ]
