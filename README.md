# victorinausk_infra
victorinausk Infra repository

HW 4
Выполнено ДЗ № 4

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

## Как запустить проект:
 - Например, запустить команду X в директории Y

## Как проверить работоспособность:
 - Например, перейти по ссылке http://localhost:8080

## PR checklist
 - [+] Выставил label с номером домашнего задания
 - [+] Выставил label с темой домашнего задания
