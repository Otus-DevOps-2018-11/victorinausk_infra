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



HW 7
Выполнено ДЗ № 7

    [+ ] Основное ДЗ


В процессе сделано:

    Сделан Packer шаблон (ubuntu16.json) с Ruby и MongoDB, c обязательными параметрами. Параментры находятся в файле variables.json.

    Задание со *

    Создан доп.шаблон Packer (immutable.json)
    Добавлен shell-cкрипт (create-reddit-vm.sh), скрипт вызовает команду запуска ВМ из соответсвующего образа, подготовленного в основном ДЗ (reddit-full)


    PR checklist

    [ +] Выставил label с номером домашнего задания
    [ +] Выставил label с темой домашнего задания

HW 8
Terraform-1

Выполнено ДЗ № 8

    [+ ] Основное ДЗ

В процессе сделано:
    создан каталог terraform
    в нем созданы конфигурации *.tf для автоматизированного развертывания ВМ с приложением в облаке GCP
Задание со *:

    в конфиг main.tf добавлена возможность добавления ssh-ключей в метаданные проекта
    создан конфиг lb.tf для создания группы ресурсов и баллансировщика нагрузки

PR checklist

    [ +] Выставил label с номером домашнего задания
    [ +] Выставил label с темой домашнего задания

HW 9
Выполнено ДЗ № 9

    [+ ] Основное ДЗ

- созданы два описания конфигурации образа для packer (app.json, db.json)
- созданы 2 конфигурации terraform для приложения и БД;
- конфигурация и деплой приложения и бд, а также сетевые настройки предаставлены в виде модулей (app, db, vpc);
- созданы два окружения stage (доступный с ограниченного числа IP-адресов) и prod, доступный всем;
- создана когфигурация storage-bucket.tf для создания бакетов в GCS;

PR checklist

    [ +] Выставил label с номером домашнего задания
    [ +] Выставил label с темой домашнего задания

HW 10
Выполнено ДЗ № 10

    [+ ] Основное ДЗ

В процессе сделано:

- Установлен Ansible для выполнения различных команд

- Созданы файлы invertory (`yml`,` json`)
- Создан конфигурационный файл `ansible.cfg` со значениями по умолчанию для проекта
- Создан ansible playbook, описанный в `clone.yml`, для проверки поведения ansible для повторяющихся задач.

Задание со *:

appuser@devops-VirtualBox:~/otus/victorinausk_infra/ansible$ ansible all -m ping -i inventory.json
34.76.27.35 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
35.189.240.68 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}


HW 11
Выполнено ДЗ № 11

    [+ ] Основное ДЗ

В процессе сделано:
 - Созданы ansible playbook:

  - reddit_app_one_play
  - reddit_app_multiple_plays
  - app.yml, db.yml, deploy.yml  Плейбуки встроены в `site.yml` для последовательной установки Reddit.
  - packer_db.yml, packer_app.yml созданы для использовании в PACKER
  - packer/app.json , packer/db.json обновлены для использования ansible playbook в место баш скриптов

HW 12
Выполнено ДЗ № 12

    [+ ] Основное ДЗ

В процессе сделано:


  - созданы ansible-роли app, db, users (создаются пользователи для {prod,stage} окружений)
  - созданы окружения {prod,stage}
  - организован каталог ansible
        плейбуки перенесены в /ansible/playbooks
        прочие файлы перенесены в /ansible/old
  - созданы файл конфигурации и инвентори файлы (ini, yml, json*) для ansible

HW 13
Выполнено ДЗ № 13

- создано локальное окружение с использованием Vagrnat, в качестве провижионера используется ansible;
- доработаны роли для работы с Vagrant, доработаны json файлы с конфигами packer для совместимости;


- создано локальное окружение пользователя для работы с molecule
- созданы тесты и протестирована конфигурация
