pipeline {
    agent any
    stages {
        stage('building docker image') {
            steps {
                sh 'docker build -t arp-jenkins'
            }
        }
        stage('clean up docker') {
            steps {
                sh '''
                    if [ -n $(awk $(docker ps -a -q))]
                        then
                        docker rm -f $(docker ps -a -q)  #删除历史纪录
                    fi
                '''
            }
        }
        stage('run docker image') {
            steps {
                sh 'docker run -d -p 8888:8080 arp-jenkins'
            }
        }
    }
}
