# helm-charts

## mundialis helm repo

    helm repo add mundialis https://mundialis.github.io/helm-charts/
    helm repo update
    helm search repo mundialis -l

## commit changes to chart

    # TODO: fix subcharts conflicts with lint
    helm lint charts/*
    helm dependency update charts/*
    helm package charts/*
    helm repo index --url https://mundialis.github.io/helm-charts/ .

    git add . && git commit -m "pages commit"
    git push origin main

## examples

### prerequisites
    helm repo add mundialis https://mundialis.github.io/helm-charts/
    helm repo update

### install actinia with default values
    helm upgrade --install actinia mundialis/actinia

### install actinia with persistence
    helm upgrade --install actinia mundialis/actinia --set "persistence.enabled=true"

### install actinia with ingress enabled
    helm upgrade --install actinia mundialis/actinia --set "ingress.enabled=true"