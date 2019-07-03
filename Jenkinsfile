pipeline{
    agent {label 'docker'}
    stages{
        stage('checkout'){
            steps{
            git credentialsId: 'gitlogin', url: 'https://github.com/anooruddh/CiCd.git'
            }
        }
        stage('build'){
            steps{
            //def mavenHome = tool name: 'maven3', type: 'maven'
            //def mavenCmd = "${mavenHome}/bin/mvn"
            sh 'mvn clean compile package'
            }
        }
        stage('docker build'){
            steps{
                sh 'docker build -t sendtoanoo/my-web-app:1.0.0.1 .'
            }
        }
        stage('push docker image'){
            steps{
             withCredentials([string(credentialsId: 'docker-password', variable: 'dockerhublogin')]) {
                sh "docker login -u sendtoanoo -p ${dockerhublogin}"
            }
            sh 'docker push sendtoanoo/my-web-app:1.0.0.1'
            }
        }
       
        stage('docker run container'){
            steps{
             withCredentials([string(credentialsId: 'docker-password', variable: 'dockerhublogin')]) {
                sh "docker login -u sendtoanoo -p ${dockerhublogin}"
            }
            sh 'docker run -d --name my-web-app -p 8080:8080 sendtoanoo/my-web-app:1.0.0.1'
            }
        }
       /*
        stage('docker run container on slave'){
            steps
            {
                script{
                    def runCommand = 'docker run -d --name my-web2 -p 8080:8080 sendtoanoo/my-web2:1.0.0.2'
                    sshagent(['slave-ssh-key']) {
                            sh "ssh -o StrictHostKeyChecking=no ec2-user@13.235.17.11 ${runCommand}"
                            sh 'whoami'
                            sh 'hostname'
                        }
                }
            }
        }
        */
        //------------------------------------
    }
}

