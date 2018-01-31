function checkForm(form) {
  if(form.username.value == "") {
      alert("¡Espera! No puedes dejar vacío el nombre de usuario");
      form.username.focus();
      return false;
  }
  re = /^\w+$/;
  if(!re.test(form.username.value)) {
    alert("Lo siento, tu nombre de usuario solamente puede tener letras, numeros y guiones bajos");
    form.username.focus();
    return false;
  } 
  if(form.pwd1.value != "" && form.pwd1.value == form.pwd2.value) {
    if(form.pwd1.value.length < 8) {
      alert("¡Espera! Tu contraseña debe tener al menos 8 caracteres");
      form.pwd1.focus();
      return false;
    }
    if(form.pwd1.value == form.username.value) {
      alert("¡Espera! La contraseña debe ser diferente a tu nombre de usuario");
      form.pwd1.focus();
      return false;
    }
  re = /[0-9]/;
      if(!re.test(form.pwd1.value)) {
        alert("¡Espera! La contraseña debe tener al menos un número del 0 al 9");
        form.pwd1.focus();
        return false;
      }
      re = /[a-z]/;
      if(!re.test(form.pwd1.value)) {
        alert("¡Espera! La contraseña debe tener al menos una letra minúscula (a-z)");
        form.pwd1.focus();
        return false;
      }
      re = /[A-Z]/;
      if(!re.test(form.pwd1.value)) {
        alert("¡Espera! La contraseña debe tener al menos una letra mayúscula (A-Z)!");
        form.pwd1.focus();
        return false;
      }
    } else {
      alert("Las contraseñas no coinciden, intenta nuevamente");
      form.pwd1.focus();
      return false;
    }
    alert("Ingresaste una contraseña válida: " + form.pwd1.value);
    return true;
}