# helm-charts

## mundialis helm repo

    helm repo add mundialis https://mundialis.github.io/helm-charts/
    helm repo update
    helm search repo mundialis -l

## commit changes to chart

    helm lint charts/*
    helm package -u charts/*

    # change branch to helm-repo
    # (move helm packages to helm-repo)

    helm repo index --url https://mundialis.github.io/helm-charts/ .

    git add . && git commit -m "pages commit"
    git push origin helm-repo

## examples

### prerequisites
    helm repo add mundialis https://mundialis.github.io/helm-charts/
    helm repo update

### install actinia with default values
    helm upgrade --install actinia mundialis/actinia

### install actinia with persistence
    helm upgrade --install actinia mundialis/actinia --set "persistence.enabled=true" --set "redis.master.persistence.enabled=true"

### install actinia with ingress enabled
    helm upgrade --install actinia mundialis/actinia --set "ingress.enabled=true"


# Local testing

For local testing you need a running installation of minikube.
Make you local changes and then run e.g.

    mydeploymentname=openeo-grassgis-driver
    mychart=openeo-grassgis-driver

    helm upgrade $mydeploymentname --install ./$mychart -f ./$mychart/values.yaml
