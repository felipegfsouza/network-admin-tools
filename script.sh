#!/bin/bash 

Menu(){
echo "|=============================================================|"
echo "|================ OLÁ $USER SEJÁ BEM VINDO ===================|"
echo "|================ AO TRN NETWORK ADMIN TOOLS =================|"
echo "|=============================================================|"

echo "_____________________________________________________"
echo "----------------- SELECIONE UMA OPÇÃO ---------------"
echo "|         [1] Instalar pacotes                      |"
echo "|         [2] Instalar programa                     |"
echo "|         [3] Atualizar  update                     |"
echo "|         [4] Atualizar  upgrade                    |"
echo "|         [5] Testes de rede                        |"
echo "          [6] Testes de Hardware                    |"
echo "|         [7] Consulta manuais                      |"
echo "|                                                   |"
echo "|___________________________________________________|"
echo 
echo -n "Qual a opcao desejada ? "
echo "   "
read option
case $option in
        1) Install_Packages  ;; #arquivos .deb

        2) Install_programs ;;

        3) Updates ;;

        4) Upgrades ;;

        5) Atualizacao ;;

        6) Test_rede ;;

        7) Test_hardware ;;

        *) Sair ;;

esac
  
}

Install_Packages(){
# separar quais programas vão precisar ser utilizados
echo "Digite o pacote que você deseser instalado com .deb no final"
read nome_do_pacote
# debian package -i install
sudo dpkg -i /home/$USER/Downloads/$arqdeb
figlet aguarde



}

Install_programs() {
echo "Digite o nome do programa que deseja instalar"
read program
apt-get install $program
# dialog --infobox '$programa instalado com sucesso' 10 20
# dialog --textbox /etc/$programa/$programa.conf 40 60
figlet Manual do comando se divirta
sleep 5
man $programa
}


Consultation_Manuals(){
# Organizar os manuais
echo "Digite o programa que você deseja ver o manual"
read consulta_programa
figlet Manual deste comando se divirta
sleep 5
man $programa

}

Updates(){
figlet buscando updates aguarde
sudo apt update
dialog --infobox 'busca por updates terminada e la vamos nos' 40 60
}

Upgrades(){
figlet Atualização em andamento
sudo apt upgrade
dialog --infobox 'programas atualizados' 40 60
}

Test_rede() {
echo "vamos ver se está pingando"
timeout 15 ping 8.8.8.8
echo "está conectado"

}

Test_hardware() {
echo "vamos instalar uma ferramenta para testar o hardware"
echo "instalar o lscpu"
sudo apt-get install lscpu
lscpu
echo "esse é o hardware do seu computador"

}

Exit_Programs() {
exit
}

Menu
