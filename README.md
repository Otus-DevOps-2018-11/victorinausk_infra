# victorinausk_infra
victorinausk Infra repository

HW 3
Выполнено ДЗ № 3

    [+ ] Основное ДЗ
    Задание со *

В процессе сделано:

    Рассмотрели работу с интеграцией на примерах
    подключили свои репозитории к тестам в Travis для
    помощи в проверке последующих ДЗ
    Добавили шаблон для последующих PR в GitHub (будет работать
    начиная со следующего ДЗ)

PR checklist

    [ +] Выставил label с номером домашнего задания
    [ +] Выставил label с темой домашнего задания

HW 5
Выполнено ДЗ № 5
- [ ] Основное ДЗ 
Исследовать способ подключения к someinternalhost в одну
команду

ssh -i ~/.ssh/appuser -J appuser@35.189.240.68 appuser@10.132.0.3
ssh -i ~/.ssh/appuser -A -t appuser@35.189.240.68 ssh 10.132.0.3

bastion_IP = 35.189.240.68 
someinternalhost_IP = 10.132.0.3

 - [ ] Задание со *
Предложить вариант решения для подключения из консоли при
помощи команды вида ssh someinternalhost из локальной
консоли рабочего устройства, чтобы подключение выполнялось по
алиасу someinternalhost и внести его в README.md в вашем репозитории

Добавить следующие варианты в ~/.ssh/config

```
Host bastion
    HostName 35.189.240.68
    User appuser
    Port 22
    ForwardAgent yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/appuser

Host someinternalhost
    User appuser
    Hostname 10.132.0.3
    Port 22
    ProxyJump bastion
    ForwardAgent Yes


## В процессе сделано:
 - Создан сервер bastion и сервер someinternalhost
 - установлен vpn сервер pritunl
 - sudo reboot on bastion-host

## Как запустить проект:
 - странная история

## Как проверить работоспособность:
 - Например, перейти по ссылке http://localhost:8080

## PR checklist
 - [+] Выставил label с номером домашнего задания
 - [+] Выставил label с темой домашнего задания


HW 6
Выполнено ДЗ № 6

    [+ ] Основное ДЗ
    

В процессе сделано:

testapp_IP = 35.244.75.160
testapp_port = 9292



-Перенесены скрипты установки и конфигурации VPN в каталог VPN
-создана VM reddit-app , установлена бд и приложение Reddit
-созданы скрипты установки и настройки приложений (install_rubby.sh, install_mongodb.sh, deploy.sh)
-создан скрипт startup.sh для автоматической установки и настройки приложения при развертывании VM в клауде


Задание со *

Создание VM:

gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=startup.sh

+++
Создание правил МСЭ:

gcloud compute firewall-rules create default-puma-server \
  --allow=tcp:9292 \
  --target-tags=puma-server \
  --description="Allow access to puma server"



В веб-браузере перейти по адресу http://35.244.75.160:9292, в окне браузера отобразится интерфейс приложения.

+++
Удаление VM

gcloud compute instances delete reddit-app


Удаление правила МЭ

gcloud compute firewall-rules delete default-puma-server

PR checklist

    [ +] Выставил label с номером домашнего задания
    [ +] Выставил label с темой домашнего задания
