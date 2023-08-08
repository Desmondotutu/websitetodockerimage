pipeline {
    agent any
    environment {
        scannerHome = tool 'SonarQubeScanner5.0'
        DependencyCheck = tool 'DP-Check'
    }
    stages {
      stage('OWASP Dependency Test') {
            steps {
                sh "${DependencyCheck}/bin/dependency-check.sh --scan . --out dependency-check-report.html"
            }
        }
      stage('Sonarqube Static Code Analysis') {
            steps {
                withSonarQubeEnv('SonarqubeServer10'){
                sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=testing"
                }
            }
        }
        /* stage('Quality Gate') {
            steps {
                waitForQualityGate abortPipeline: false, credentialsId: 'sonar'
            }
        } */
        stage('Quality Gate') {
            steps {
                script {
                    def qualityGateUrl = "https://4b22a52cd41c.mylabserver.com/" // Replace with your SonarQube server URL
                    def webhookData = webhook(
                        url: "${qualityGateUrl}/api/webhooks/list",
                        contentType: 'APPLICATION_JSON',
                        method: 'GET'
                    )
                    def webhookId = webhookData.find { it.name == 'jenkins-webhook' }?.id // Replace with your webhook's name

                    def qualityGateStatus = webhook(
                        url: "${qualityGateUrl}/api/webhooks/${webhookId}/deliveries/latest",
                        contentType: 'APPLICATION_JSON',
                        method: 'GET'
                    ).qualityGate.status

                    if (qualityGateStatus == 'ERROR') {
                        error("Quality Gate failed")
                    }
                }
            }
        }
        stage('Docker Build Image') {
            steps {
                sh "docker build -t desmondo1/webapp:latest ."
            }
        }

        stage('Trivy Docker Image Scan') {
            steps {
                sh "trivy image desmondo1/webapp:latest"
            }
        }
         stage('Push Image to DockerHub'){
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
