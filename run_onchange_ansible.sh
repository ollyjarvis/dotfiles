echo ""
echo "->->->->->->->->->->->> Running Ansible <<-<-<-<-<-<-<-<-<-<-<-"
echo ""

ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo ""
echo "->->->->->->->->->->->> Ansible Finished <<-<-<-<-<-<-<-<-<-<-<-"
echo ""
