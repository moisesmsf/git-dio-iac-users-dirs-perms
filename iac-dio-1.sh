echo "Creating directories and setting permissions...\n"
mkdir --mode=770 --parents /ven /adm /sec && mkdir --mode 777 --parents /public
echo ""

echo "Creating groups...\n"
groups_name=("GRP_ADM" "GRP_VEN" "GRP_SEC")

for group in ${groups_name[@]};
do
    groupadd -f $group
done
echo ""

echo "Setting ownsership...\n"
chown root:GRP_ADM /adm && chown root:GRP_VEN /ven && chown root:GRP_SEC /sec
echo ""

echo "Creating users...\n"
users_adm=("carlos" "maria" "joao")
users_ven=("debora" "sebastiana" "roberto")
users_sec=("josefina" "amanda" "rogerio")

echo "Creating administratives users"
for name in ${users_adm[@]};
do
    useradd $name -N -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123)
done
echo ""

echo "Creating vendors users"
for name in ${users_ven[@]};
do
    useradd $name -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123)
done
echo ""

echo "Creating security users"
for name in ${users_sec[@]};
do
    useradd $name -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123)
done
echo ""
echo "Finished"
