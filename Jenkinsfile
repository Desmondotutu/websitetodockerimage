pipeline {
    agent any
    environment {
        scannerHome = tool 'SonarQubeScanner5.0'
        DependencyCheck = tool 'DP-Check'
    }
    stages {
        stage("Cleanup Workspace"){
            steps {
                cleanWs()
            }

        }

      stage('Dependency Test') {
            steps {
                sh "${DependencyCheck}/bin/dependency-check.sh --scan . --out dependency-check-report.html"
            }
        }
      stage('Static Code Analysis') {
            steps {
                withSonarQubeEnv('SonarqubeServer10'){
                sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=testing"
                }
            }
        }
        stage('Docker Build') {
            steps {
                sh "docker build -t desmondo1/webapp:latest ."
            }
        }

        stage('trivy') {
            steps {
                sh "trivy image desmondo1/webapp:latest"
            }
        }
         stage('Push image to Hub'){
            steps{
                script{
                  withDockerRegistry(credentialsId: 'dockerHubCredentials'){
                   sh 'docker push desmondo1/webapp:latest'
                    }
                }
            }
        }
    }
}
