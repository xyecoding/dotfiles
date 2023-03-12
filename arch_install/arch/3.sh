echo "EricArch" > /etc/hostname

cat > /etc/hosts << 'EOF'
127.0.0.1   localhost
::1         localhost
127.0.1.1   EricArch
EOF
