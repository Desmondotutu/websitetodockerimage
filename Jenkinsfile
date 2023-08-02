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
      /*  stage('Dependency Test') {
            steps {
                sh "${DependencyCheck}/bin/dependency-check.sh --scan . --format HTML --project 'WebsiteToDockerImage' --out dependency-check-report.html"
            }
        } */
        stage('Security Scan') {
            steps {
                withSonarQubeEnv("sonarServer9.9") {
                    sh "${sonarHome}/bin/sonar-scanner -Dsonar.projectKey=webtoimage -Dsonar.sources=. -Dsonar.host.url=http://18.209.175.91:8089 -Dsonar.token=sqp_c3ea91b577fab9f279e0fd3d79f669f4831db5a6"
                }
            }
        }
    }
}

