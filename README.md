# devsecops-netflix-clone




Currently still working on this repository to build a production-grade DevSecOps pipeline for a Netflix Clone.
The project provisions Azure Kubernetes Service (AKS) via Infrastructure-as-Code and deploys the containerized frontend using Helm charts.
Future enhancements include implementing automated CI/CD workflows, vulnerability scanning, and GitOps deployments with ArgoCD.

mermaid
graph TD
Dev[Developer] -->|Push Code| Git[GitHub Repository]

subgraph CI_CD [CI / CD Pipeline]
    Git -->|Trigger| GHA[GitHub Actions CI/CD]
    GHA -->|Build & Push Image| ACR[Azure Container Registry]
end

subgraph GitOps [GitOps Sync]
    Git -->|Read Manifests| ArgoCD[ArgoCD Controller]
    ACR -->|Fetch Image| ArgoCD
end

subgraph Kubernetes [Azure Kubernetes Service - AKS]
    ArgoCD -->|Deploy & Sync| Pods[Pods / Frontend UI]
end

classDef default fill:#1e1e1e,stroke:#ffffff,stroke-width:1px,color:#fff;
classDef highlight fill:#2d3748,stroke:#63b3ed,stroke-width:2px,color:#fff;
class Dev,Git,GHA,ACR,ArgoCD,Pods highlight;
