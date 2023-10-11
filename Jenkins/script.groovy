def codeAnalysis() {
  echo "Code analysis successfully completed!"
}

def unitTest() {
  echo "Unit test successfully completed!"
}

def build() {
  echo "Build successfully completed!"
}

def deploy() {
  echo "Deploying with ${AZURE_CREDENTIALS}"

  if (BRANCH_NAME == 'main') {
    echo "Deploying to DEV"
  } else if (BRANCH_NAME == 'QA') {
    echo "Deploying to QA"
  } else {
    echo "Deploying to PROD"
  }

  echo "Deployed ${params.VERSION} as part of ${params.TYPE} successfully!"
}

return this
