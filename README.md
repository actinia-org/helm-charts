# helm-charts

## actinia-org helm repo

    helm repo add actinia-org https://actinia-org.github.io/helm-charts/
    helm repo update
    helm search repo actinia-org -l

## commit changes to chart
GitHub Actions for linting:
- For each PR or change to main branch, the charts will be linted.

GitHub Actions for releasing:
- For each change to main branch (e.g. pull request is merged),
a release is made for each chart in case the chart version was changed.
- The release is named `<chart-name>-<chart-version>`.
- The chart is packed, added to the release and the chart index is updated.

## examples

### prerequisites
    helm repo add actinia-org https://actinia-org.github.io/helm-charts/
    helm repo update

### install actinia with default values
    helm upgrade --install actinia actinia-org/actinia

### install actinia with persistence
    helm upgrade --install actinia actinia-org/actinia --set "persistence.enabled=true" --set "redis.master.persistence.enabled=true"

### install actinia with ingress enabled
    helm upgrade --install actinia actinia-org/actinia --set "ingress.enabled=true"

# Local testing

For local testing you need a running installation of minikube.
Make you local changes and then run e.g.

    mydeploymentname=openeo-grassgis-driver
    mychart=openeo-grassgis-driver

    helm upgrade $mydeploymentname --install ./$mychart -f ./$mychart/values.yaml

## pack a chart locally and update the index

    helm lint charts/*
    helm package -u charts/*
    # or only build a single chart
    helm package -u charts/openeo-grassgis-driver/
    helm repo index --url https://actinia-org.github.io/helm-charts/ .
