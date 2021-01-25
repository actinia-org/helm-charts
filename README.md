# helm-charts

## mundialis helm repo

    helm repo add mundialis https://mundialis.github.io/helm-charts/
    helm search repo mundialis -l

## commit changes to chart

    helm lint charts/*
    helm package charts/*
    helm repo index --url https://mundialis.github.io/helm-charts/ .

    git add . && git commit -m "pages commit"
    git push origin main
