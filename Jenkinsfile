pipeline {
    agent any
    environment {
        sonarHome = tool 'SonarQubeScanner5.0'
        DependencyCheck = tool 'DP-Check'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Desmondotutu/websitetodockerimage.git'
            }
        }
      stage('Dependency Test') {
            steps {
                sh "${DependencyCheck}/bin/dependency-check.sh --scan . --format HTML --project 'WebsiteToDockerImage' --out dependency-check-report.html"
            }
        }
      stage('Security Scan') {
            steps {
                withSonarQubeEnv() {
                    sh "${sonarHome}/bin/sonar-scanner"
                }
            }
        }
    }
}

