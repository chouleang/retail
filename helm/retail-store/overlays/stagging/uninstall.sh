#Trigger token to access public ecr
aws ecr-public get-login-password --region us-east-1 | \
  helm registry login -u AWS --password-stdin public.ecr.aws
# Start Install helm
helm uninstall catalog 

helm uninstall carts 

helm uninstall checkout

helm uninstall orders

helm uninstall ui
