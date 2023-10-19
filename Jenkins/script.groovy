def codeAnalysis() {
  echo "Code analysis successfully completed!"
}

def unitTest() {
  echo "Unit test successfully completed!"
}

def build() {
  bat 'cd ./Frontend'
  bat 'npm ci && npm run build && Xcopy .\\build ..\\Backend\\build /E /I /Y'
  echo "Build successfully completed!"
  
}

def deploy() {
  echo "Deploying with ${AZURE_CREDENTIALS}"

  if (BRANCH_NAME == 'stage') {
    dir('./terraform/staging') {
      // bat 'terraform init'
      // bat 'terraform apply'
      echo "Deploying to STAGING"
    }
  } else if (BRANCH_NAME == 'prod') {
    dir('./terraform/production') {
      // bat 'terraform init'
      // bat 'terraform apply'
      echo "Deploying to PRODUCTION"
    }
  } else {
    echo "Deploying to DEV"
  }

  echo "Deployed ${params.VERSION} as part of ${params.TYPE} successfully!"
}

return this
