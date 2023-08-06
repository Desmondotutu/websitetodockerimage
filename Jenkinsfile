pipeline {
    agent any
    environment {
        scannerHome = tool 'SonarQubeScanner5.0'
        DependencyCheck = tool 'DP-Check'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Desmondotutu/websitetodockerimage.git'
            }
        }
      stage('Dependency Test') {
            steps {
                sh "${DependencyCheck}/bin/dependency-check.sh --scan . --out dependency-check-report.html"
            }
        }
      stage('Security Scan') {
            steps {
                scripts{
                withSonarQubeEnv('SonarqubeServer10'){
                    sh "${scannerHome}/bin/sonar-scanner"
                }
                }
            }
        }
    }
}
