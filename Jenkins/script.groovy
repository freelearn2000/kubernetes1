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
  echo "Deployed ${params.VERSION} as part of ${params.TYPE} successfully!"
}

return this
