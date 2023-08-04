pipeline {
    agent any
    environment {
        scannerHome = tool 'SonarQubeScanner5.0'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Desmondotutu/websitetodockerimage.git'
            }
        }
      /*stage('Dependency Test') {
            steps {
                sh "${DependencyCheck}/bin/dependency-check.sh --scan . --format HTML --project 'WebsiteToDockerImage' --out dependency-check-report.html"
            }
        }*/
      stage('Security Scan') {
            steps {
                scripts{
                withSonarQubeEnv(credentialsId: 'sonar-secret', installationName: 'SonarqubeServer10'){
                    sh "${scannerHome}/bin/sonar-scanner"
                }
                }
            }
        }
    }
}
