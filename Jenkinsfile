/*
pipeline {
    agent any
    environment {
        scannerHome = tool 'SonarQubeScanner5.0'
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
                withSonarQubeEnv('SonarqubeServer10') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
    }
} */
node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def scannerHome = tool 'SonarQubeScanner5.0';
    withSonarQubeEnv() {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
}

