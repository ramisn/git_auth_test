/* Requires the Docker Pipeline plugin */
node('docker') {
    checkout scm
    stage('Build') {
        docker.image('ruby').inside {
            sh 'ruby --version'
            sh 'ruby git_status_check.rb'

        }
    }
}
