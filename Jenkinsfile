pipeline {
    agent any
    tools{
        maven 'maven-3.8.1'
    }

    stages{
        stage('Git Checkout') {
            steps{
                checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'My-Github-creds', url: 'https://github.com/custyblak/maven-ci.git']])
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
        stage('Test') {
            steps{
                sh 'mvn test'
            }

        }
    }
    
}
