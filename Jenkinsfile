pipeline {
    agent any
    // agent {
    //     dockerfile {
    //         filename 'Dockerfile'
    //         reuseNode true
    //     }
    // }

    environment {
        ANSIBLE_LIBRARY = '/oneview-ansible/library'
        ANSIBLE_MODULE_UTILS = '/oneview-ansible/library/module_utils/'
    }

    stages {
        stage('VCSA status') {
            steps {
                sh 'ping -c 3 130.175.94.57'
            }
        }

        stage('Playbook Test') {
            steps {
                ansiblePlaybook(credentialsId: '~/.ssh/id_rsa', inventory: 'examples/hosts', playbook: 'examples/oneview_server_profile_facts.yml')
                // sh 'ansible-playbook examples/oneview_server_profile_facts.yml '
            }
        }
        stage('oneview_automation_demo') {
            steps {
                 sh 'pwd && sh ansible/ONEVIEW/scripts/csvtoyml.sh'
                ansiblePlaybook(credentialsId: '~/.ssh/id_rsa', inventory: 'ansible/ONEVIEW/files/inventory', playbook: 'ansible/ONEVIEW/main.yml')
            }
        }
    }
}
