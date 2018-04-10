pipeline {
    agent any

    stages {
        stage('Controller') {
            steps {
                sh 'ping -c 3 ctrl1'
            }
        }
        stage('iLO') {
            steps {
                sh 'ping -c 3 130.175.202.99'
            }
        }
        stage('ESXi') {
            steps {
                sh 'ping -c 3 esx1'
            }
        }
        stage('VCSA') {
            steps {
                sh 'ping -c 3 vcsa1'
                sh 'ping -c 3 localhost'
            }
        }
        stage('OneView') {
            steps {
                sh 'ping -c 3 onev1'
            }
        }
        stage('OneView-Ansible') {
            steps {
                sh 'ssh ctrl1 docker inspect --format="{{.State.Running}}" dazzling_hypatia'
            }
        }
        stage('Jenkins') {
            steps {
                sh 'ssh ctrl1 docker inspect --format="{{.State.Running}}" quizzical_feynman'
            }
        }
    }
}
