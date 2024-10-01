pipeline {
    agent any
    tools{
        maven 'maven-3.8.1'
    }

    stages{
        stage('Git Checkout') {
            steps{
                checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'My-Github-creds', url: 'https://github.com/custyblak/maven-ci.git']])
            }
        }

        stage('Validate') {
            steps{
                sh 'mvn validate'
            }

        }
        stage('Compile')   {
            steps{
                sh 'mvn compile'
            }

        }
        stage('SonarQube Analysis') {
            environment {
               sonarscan = tool 'my-first-sonarqube'
            }
            withSonarQubeEnv(credentialsId: 'sonarqube-jenkins'installationName: 'my-sonarqube') {
                  sh "$sonarscan/bin/sonar-scanner -Dsonar.projectKey=my-jenkins-job -Dsonar.projectName='my-jenkins-job'"
            }
        }
        
    }
    
}
