import 'package:flutter/material.dart';

const kDefaultPaddin = 10.0;
const defaultPaddinBodyHome = 3.0;
const defaultPaddingLeftAndRight = 5.0;
const childAspectRatioBodyHome = 0.75;
const defaultPaddingTextObjectsHome = 4.0;
const defaultPaddingImageObjectsHome = 0.5;
const defaultPaddingHome = 0.9;
const defaultSpaceBetweenObjectsDescription = 4.0;
const defaultSpaceBetweenTextAndButtonDescription = 40.0;

//TODO Profile
const textTitleProfile = 'Profile User';
const textNoDataUserInitial = 'No tiene acceso ya que no está logueado. Diríjase a la opción Login.';
const textUnknownState = 'Estado no reconocido';
const textChangeProfileTitle = 'Change Profile User';
const textButtonChangeName = 'Cambiar Nombre';
const textButtonChangeLastName = 'Cambiar Apellido';
const textButtonChangeIdentification = 'Cambiar Documento';
const textButtonChangePhone = 'Cambiar Teléfono';
const textButtonChangeEmail = 'Cambiar Email';
const textButtonChangePassword = 'Cambiar Password';
const textButtonChangeGenre = 'Cambiar Género';
const textButtonChangeBirthdate = 'Cambiar Cumpleaños';
const textButtonChangeTypeStudent = 'Cambiar Tipo Estudiante';
const textButtonChangeWebPage = 'Cambiar Página Web';
const textButtonDeleteUser = 'Darse de baja';
const textWriterNewChangeByVariable = 'Escriba su nuevo ';
const textSendDataButton = 'Enviar Cambios';
const textTitleResultChangeNotExists = 'Resultado de su solicitud: ';
const textTypeChangeNotExists = 'No existe lo solicitado';
const textButtonShowDialogProfile = 'OK';
const textGetUserSuccess = 'Se ha encontrado su perfil correctamente.';

//TODO Applicant
const textButtonAppliedByJobOffer = 'POSTULARSE';
const textLabelPostulateService = 'Resultado de su postulación';
const textResultPostulateMessageService = 'Se ha postulado exitosamente.';
const textFailedPostulateMessageService = "Fallo la aplicación al Joboffers.";

//TODO Search
const textDecorationHintTextSearch = "Buscar...";
const textTitleSearching = 'Buscar contenga letra...';

//TODO Drawer
const textWelcome = "Bienvenido: ";
const textWebSite = "Web Site: ";
const textWebSiteName = "Bolsa de Trabajo";
const textTypeVehiclesWebSite = "Estudiantes CUVL-UTN";
const textContactTitle = "Contacto: ";
const textContactPhone = "119876543 - 1123459877";
const textContactEmail = "bolsadetrabajo@algunlugar.com.ar";
const textInitialsWebSiteName = 'BT';
const textDarkModeTheme = 'Dark Mode';
const textCustomModeTheme = 'Custom Theme';
const textLogin = 'Login - Register';
const textLogout = 'Logout';

//TODO DropdownButtonFormField
const textSelectedRoleInRegister = 'Seleccionar uno...';
const textSelectedEvalutaionJobOffer = 'Seleccionar un estado...';

//TODO Login
const textTitle = 'Login';
const textNewAccount = 'Crea una nueva cuenta';
const textButtonActionRegister = 'Registrarse';
const textYouEmail = 'tuCasillaDeEmail@gmail.com';
const textLabelTitleEmail = 'Correo electrónico';
const textInvalidData = 'El valor ingresado no es un correo valido';
const textRegexPatternEmail = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const textFormatPassword = '*******';
const textLabelTitlePassword = 'Contraseña';
const textInvalidDataPassword = 'La contraseña debe de ser mayor o igual a 7 caracteres';
const textResultErrorLoginTitle = 'Resultado del Login';
const textResultInvalidDataLogin = 'Error en el proceso de login. Incorrecto password o su usuario no existe.';
const textButtonShowDialogLogin = 'OK';

//TODO Register
const textTitleRegister = 'Register';
const textHintTextNameRegister = 'ingrese su nombre';
const textLabelNameRegister = 'Nombre';
const textRegexPatternByString =  r'^[a-zA-Z\s]{2,50}$';
const textRegexPatternByStringWithNumber =  r'^[a-zA-Z0-9\s]{2,50}$';
const textInvalidDataFormat = 'El texto ingresado no es valido o tiene hasta 80 caracteres maximo';
const textPhoneInvalidDataFormat = 'Ingrese hasta 15 caracteres solamente del tipo numerico';
const textHintTextLastNameRegister = 'ingrese su apellido';
const textLabelLastNameRegister = 'Apellido';
const textHintIdentificationRegister = 'ingrese su dni o cuit sin guiones ni puntos';
const textLabelIdentificationRegister = 'DNI o CUIT';
const textIdentificationInvalidDataFormat = 'Ingrese hasta 11 caracteres solamente del tipo numerico';
const textHintTextPhoneRegister = 'ingrese su telefono';
const textLabelPhoneRegister = 'Telefono';
const textHintBirthDateRegister = 'fecha nacimiento formato yyyy-MM-dd';
const textLabelBirthDateRegister = 'Fecha de Nacimiento';
const textHintWebSiteRegister = 'Ingrese su web site';
const textLaberWebSiteRegister = 'Web Site';
const textErrorWebSiteRegister = 'El texto ingresado no es correcto o formato invalido.';
const textRegexPatternByPhoneNumber = r'^[0-9]{2,50}$';
const textHintTextStreetRegister = 'ingrese su calle y número de domicilio';
const textLabelStreetRegister = 'Domicilio';
const textResultRegisterTitle = 'Resultado del Registro de Usuario';
const textRegisterPersonSuccess = 'Se ha registrado exitosamente. Debe confirmar y activar su cuenta a traves del email que le llegue.';
const textResultInvalidDataRegister = 'Error en el proceso de registro. Incorrectos los datos. Vuelva a intentar.';
const textButtonShowDialogRegister = 'OK';

//TODO Welcome
const textWelcomeTitleAnimation = "Bienvenido!!!";

//TODO Main
const textTitleWebSite = 'Jobs Bank';
const textInitialRouteApp = 'login';

//TODO Title AppBar
const textTitleAppBarByHome = "Bolsa de Trabajo UTN";
const textTitleAppBarByApplicant = 'Menu Estudiante';
const textTitleAppBarByPublisher = 'Menu Empresario';
const textTitleAppBarByUtn = 'Menu Administrativo';
const textTitleChangeProfile = 'Opciones de Cambio';

//TODO tooltip
const textToolTipTruck = 'Home Trucks';
const textToolTipCar = 'Home Cars';
const textToolTipVan = 'Home Vans';
const textToolTipLogout = 'Desloguearse';
const textToolTipSearch = 'Buscador';

//TODO Buttons

//TODO Mensajes de la capa Serivce
const logPostulateFailedApplicantService = "Fallo al postularse al aviso solicitado.";
const logLoginFailedAuthenticationService = "Fallo al intentar loguearse, revise su username y password.";
const logLogoutFailedAuthenticationService = 'Fallo al intentar desloguearse.';
const logRegisterStudentAuthenticationService = "Fallo el registro del estudiante.";
const logRegisterPublisherAuthenticationService = "Fallo el registro del publicador.";
const logJobOfferAllFailed = "Fallo traer la lista de Joboffers";
const logJobOfferApplicantFailed = "Fallo traer la lista de jobOfferApp";
const logNotModifiedProfile = 'No se ha podido modificar el perfil en la bd.';
const logDeleteProfileUserFailed = 'No pudo ser eliminado su Perfil y usuario.';
const logGetUserFailed = 'No se encuentra el usuario o ha fallado el traer su perfil';

//TODO Joboffer
const logJobOfferFailedBodyHome = "Error al traer joboffer en Body Home.";
const logJobOfferFailedBodyPublished = "Error al traer joboffer del publicador en Body Published.";
const textResultCreateJobOffer = 'Resultado del Pedido: ';
const logErrorCreateJobOffer = "Fallo la creacion del nuevo Joboffer - Aviso";
const logJobOfferListEmpty = 'La lista esta vacia ya que no debe tener ningun aviso propio publicado.';
const logJobOffersStatePendingEmpty = 'La lista de Avisos en estado Pendiente esta vacia.';
const logJobOfferEvaluationFailed = 'Devuelve un Not Found ya que no encuentra el aviso o hay información incorrecta.';
const logJobOffersIsEmpty = 'La lista de Avisos esta vacia y aun no hay avisos publicados.';

//TODO JobofferApplicant
const logJobOfferAppFailedBodySubscribed = "Fallo traer la lista de los estudiantes subscriptos al aviso.";
const logJOAppFailedBodyJOApplicant = "Error al traer los avisos que estoy subscripto.";
const logJOAPPListIsEmpty = 'La lista esta vacia y no tiene postulantes.';
const logJOAPPListIsEmptyApplied = 'La lista esta vacia, no has aplicado a ninguna oferta laboral.';

//TODO PublishForm
const textRegexPattern = r'^[a-zA-ZñÑ\s]{2,50}$';
const textAndNumberRegexPattern = r'^[a-zA-Z0-9\s]{2,100}$';
const numberRegexPattern = r'^[0-9]{2,50}$';
const hintTextTitle = 'Ingrese título del aviso maximo 30 caracteres';
const labelTextTitle = 'Título';
const invalidFormatTitle = 'Ingrese hasta 30 caracteres y solo tipo letras.';
const hintTextDescription = 'Ingrese la descripcion del aviso maximo 50 caracteres';
const labelTextDescription = 'Descripción';
const invalidFormatDescription = 'Ingrese hasta 50 caracteres y solo tipo letras.';
const hintTextArea = 'Ingrese Area del puesto maximo 15 caracteres.';
const labelTextArea = 'Area';
const invalidFormatArea = 'Ingrese hasta 15 caracteres y solo tipo letras.';
const hintTextBody = 'Ingrese el cuerpo del aviso maximo 100 caracteres.';
const labelTextBody = 'Cuerpo Aviso';
const invalidFormatBody = 'Ingrese hasta 100 caracteres solamente, pueden ser letras y/o numeros.';
const hintNumberExperience = 'Ingrese cantidad en años de experiencia requerida.';
const labelNumberExperience = 'Experiencia en años';
const invalidFormtaExperience = 'Ingrese caracteres solamente numericos y no mayor a 50.';
const textSelectedModality = 'Seleccionar un tipo de modalidad...';
const textSelectedPosition = 'Seleccionar un tipo de posicion...';
const textSelectedCategory = 'Seleccionar un tipo de categoría...';