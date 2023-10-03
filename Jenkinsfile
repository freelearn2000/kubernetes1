pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo "Successfully Checked out source from GitHub repo!";
            }
        }
        stage('Code Analysis') {
            steps {
                dir('Jenkins') {
                    bat 'Analysis.bat';
                }
                echo "Code analysis successfully completed!";
            }
            
        }
        stage('Build') {
            steps {
                dir('Jenkins') {
                    bat 'Build.bat';
                }
                echo "Build successfully completed!"
            }
            
        }
        stage('Test') {
            steps {
                dir('Jenkins') {
                    bat 'Test.bat';
                }
                echo "Unit test successfully completed!"
            }
            
        }
        stage('Deploy') {
            steps {
                dir('Jenkins') {
                    bat 'Deploy.bat';
                }
                echo "Deployed successfully!"
            }
        }
    }
    post {
        always {
            echo "This will always run"
        }
        success {
            echo "This will run only if successful"
        }
        failure {
            echo "This will run only if failed"
        }
        unstable {
            echo "This will run only if run was marked as unstable"
        }
        changed {
            echo "This will run only if previous & current state of run was changed"
        }
    }
}
