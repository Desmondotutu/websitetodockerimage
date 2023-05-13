pipeline {
    agent any
    environment {
        sonarScanner = tool 'SonarScanner'
        DependencyCheck = tool 'dependencyCheck'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Desmondotutu/websitetodockerimage.git'
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
                    sh "${SonarScanner}/bin/sonar-scanner"
                }
            }
        }
    }
}

