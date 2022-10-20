pipeline {
    agent any

    stages {

        stage('clear known_hosts') {
            steps {
              sh "./clear_known_hosts.sh"
            }
        }

        stage('build') {
          steps {
              sshagent(credentials: ['	0bb393cf-d60f-49d8-ac60-d5031886dfa5']) {
                sh "ssh -J quoterback.ru 192.168.10.21 'bash -s' < provision_script.sh '${env.BRANCH_NAME}'"
              }
          }
        }

    }
}
