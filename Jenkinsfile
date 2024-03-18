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
                sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
       stage('Quality Gate') {
            steps {
                script {
                    waitForQualityGate abortPipeline: true, credentialsId: 'sonar-creds'
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
                  withDockerRegistry(credentialsId: 'dockerhub-creds'){
                   sh 'docker push desmondo1/webapp:latest'
                    }
                }
            }
        }
    }
}
