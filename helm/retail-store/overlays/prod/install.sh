#Trigger token to access public ecr
aws ecr-public get-login-password --region us-east-1 | \
  helm registry login -u AWS --password-stdin public.ecr.aws
# Start Install helm
helm upgrade --install catalog ../../../charts/catalog/ \
  --version 1.3.0 -f values-catalog-v2.yaml --wait --timeout 5m

helm upgrade --install carts oci://public.ecr.aws/aws-containers/retail-store-sample-cart-chart \
  --version 1.3.0 -f values-cart.yaml --wait --timeout 5m

helm upgrade --install checkout oci://public.ecr.aws/aws-containers/retail-store-sample-checkout-chart \
  --version 1.3.0 -f values-checkout.yaml --wait --timeout 5m

helm upgrade --install orders ../../../charts/orders \
  --version 1.3.0 -f values-orders-v2.yaml --wait --timeout 5m

helm upgrade --install ui oci://public.ecr.aws/aws-containers/retail-store-sample-ui-chart \
  --version 1.3.0 -f values-ui.yaml --wait --timeout 5m
