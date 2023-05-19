pipeline {
    agent any
    environment {
        sonarHome = tool 'SonarQubeScanner'
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
                withSonarQubeEnv('sonarServer') {
                    sh "${sonarHome}/bin/sonar-scanner -Dsonar.projectKey=webtoimage"
                }
            }
        }
    }
}

