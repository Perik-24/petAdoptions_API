/*
 Navicat Premium Data Transfer

 Source Server         : LocalHost
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : localhost:3306
 Source Schema         : refugiomascotas

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : 65001

 Date: 01/12/2025 17:26:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bit_donaciones
-- ----------------------------
DROP TABLE IF EXISTS `bit_donaciones`;
CREATE TABLE `bit_donaciones`  (
  `eCodDonacion` int(11) NOT NULL AUTO_INCREMENT,
  `eCodDonador` int(11) NULL DEFAULT NULL,
  `dMonto` decimal(10, 2) NULL DEFAULT NULL,
  `tDescripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fhFecha` date NULL DEFAULT NULL,
  PRIMARY KEY (`eCodDonacion`) USING BTREE,
  INDEX `eCodDonador`(`eCodDonador`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bit_donaciones
-- ----------------------------

-- ----------------------------
-- Table structure for bit_historialmedico
-- ----------------------------
DROP TABLE IF EXISTS `bit_historialmedico`;
CREATE TABLE `bit_historialmedico`  (
  `eCodHistorial` int(11) NOT NULL AUTO_INCREMENT,
  `eCodMascota` int(11) NULL DEFAULT NULL,
  `eCodVacuna` int(11) NULL DEFAULT NULL,
  `tDiagnostico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tTratamiento` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fhFecha` date NULL DEFAULT NULL,
  PRIMARY KEY (`eCodHistorial`) USING BTREE,
  INDEX `eCodMascota`(`eCodMascota`) USING BTREE,
  INDEX `eCodVacuna`(`eCodVacuna`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bit_historialmedico
-- ----------------------------

-- ----------------------------
-- Table structure for bit_seguimientos
-- ----------------------------
DROP TABLE IF EXISTS `bit_seguimientos`;
CREATE TABLE `bit_seguimientos`  (
  `eCodSeguimiento` int(11) NOT NULL AUTO_INCREMENT,
  `eCodAdopcion` int(11) NULL DEFAULT NULL,
  `tDescripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fhFechaVisita` date NULL DEFAULT NULL,
  PRIMARY KEY (`eCodSeguimiento`) USING BTREE,
  INDEX `eCodAdopcion`(`eCodAdopcion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bit_seguimientos
-- ----------------------------

-- ----------------------------
-- Table structure for cat_archivosmascotas
-- ----------------------------
DROP TABLE IF EXISTS `cat_archivosmascotas`;
CREATE TABLE `cat_archivosmascotas`  (
  `eCodArchivo` int(11) NOT NULL AUTO_INCREMENT,
  `eCodMascota` int(11) NULL DEFAULT NULL,
  `tNombreArchivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tRuta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fhSubida` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`eCodArchivo`) USING BTREE,
  INDEX `eCodMascota`(`eCodMascota`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_archivosmascotas
-- ----------------------------

-- ----------------------------
-- Table structure for cat_categoriasproductos
-- ----------------------------
DROP TABLE IF EXISTS `cat_categoriasproductos`;
CREATE TABLE `cat_categoriasproductos`  (
  `eCodCategoriaProductos` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`eCodCategoriaProductos`) USING BTREE,
  UNIQUE INDEX `tNombre`(`tNombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_categoriasproductos
-- ----------------------------
INSERT INTO `cat_categoriasproductos` VALUES (4, 'Accesorios');
INSERT INTO `cat_categoriasproductos` VALUES (1, 'Alimento');
INSERT INTO `cat_categoriasproductos` VALUES (7, 'Arena y Sustratos');
INSERT INTO `cat_categoriasproductos` VALUES (5, 'Cuidado');
INSERT INTO `cat_categoriasproductos` VALUES (6, 'Equipamiento');
INSERT INTO `cat_categoriasproductos` VALUES (3, 'Higiene');
INSERT INTO `cat_categoriasproductos` VALUES (2, 'Medicinas');
INSERT INTO `cat_categoriasproductos` VALUES (8, 'Snacks');

-- ----------------------------
-- Table structure for cat_ciudades
-- ----------------------------
DROP TABLE IF EXISTS `cat_ciudades`;
CREATE TABLE `cat_ciudades`  (
  `eCodCiudad` int(11) NOT NULL AUTO_INCREMENT,
  `eCodEstado` int(11) NOT NULL,
  `tNombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`eCodCiudad`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_ciudades
-- ----------------------------
INSERT INTO `cat_ciudades` VALUES (1, 1, 'Aguascalientes');
INSERT INTO `cat_ciudades` VALUES (2, 1, 'Jesús María');
INSERT INTO `cat_ciudades` VALUES (3, 9, 'Álvaro Obregón');
INSERT INTO `cat_ciudades` VALUES (4, 9, 'Coyoacán');
INSERT INTO `cat_ciudades` VALUES (5, 9, 'Cuauhtémoc');
INSERT INTO `cat_ciudades` VALUES (6, 9, 'Miguel Hidalgo');
INSERT INTO `cat_ciudades` VALUES (7, 14, 'Guadalajara');
INSERT INTO `cat_ciudades` VALUES (8, 14, 'Zapopan');
INSERT INTO `cat_ciudades` VALUES (9, 14, 'Tlaquepaque');
INSERT INTO `cat_ciudades` VALUES (10, 19, 'Monterrey');
INSERT INTO `cat_ciudades` VALUES (11, 19, 'San Pedro Garza García');
INSERT INTO `cat_ciudades` VALUES (12, 19, 'Guadalupe');
INSERT INTO `cat_ciudades` VALUES (13, 22, 'Santiago de Querétaro');
INSERT INTO `cat_ciudades` VALUES (14, 22, 'San Juan del Río');
INSERT INTO `cat_ciudades` VALUES (15, 31, 'Mérida');
INSERT INTO `cat_ciudades` VALUES (16, 31, 'Kanasín');

-- ----------------------------
-- Table structure for cat_departamentos
-- ----------------------------
DROP TABLE IF EXISTS `cat_departamentos`;
CREATE TABLE `cat_departamentos`  (
  `eCodDepartamento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eCodDireccionArea` int(11) NOT NULL,
  `tResponsable` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodDepartamento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_departamentos
-- ----------------------------
INSERT INTO `cat_departamentos` VALUES (1, 'SISTEMAS', 1, 'LUIS VARGAS', 'AC');
INSERT INTO `cat_departamentos` VALUES (2, 'DIRECCION', 1, 'DIRECTOR', 'AC');
INSERT INTO `cat_departamentos` VALUES (3, 'OPERACIONES', 1, 'USUARIO', 'AC');

-- ----------------------------
-- Table structure for cat_donadores
-- ----------------------------
DROP TABLE IF EXISTS `cat_donadores`;
CREATE TABLE `cat_donadores`  (
  `eCodDonador` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tApellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tCorreo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tTelefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tTipoDonador` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tDireccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `eCodCiudad` int(11) NOT NULL,
  `eCodEstado` int(11) NOT NULL,
  `tCodigoPostal` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tNotas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fhRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodDonador`) USING BTREE,
  INDEX `eCodCiudad`(`eCodCiudad`) USING BTREE,
  INDEX `eCodEstado`(`eCodEstado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_donadores
-- ----------------------------
INSERT INTO `cat_donadores` VALUES (1, 'ERICK', 'MARTINEZ LOZADA', 'utm22030701@utma.edu.mx', '(449) 28 82314', 'Individual', 'Residencial Las plazas', 14, 30, '20126', 'Ninguna', '2025-11-29 09:51:17', 'AC');

-- ----------------------------
-- Table structure for cat_empresas
-- ----------------------------
DROP TABLE IF EXISTS `cat_empresas`;
CREATE TABLE `cat_empresas`  (
  `eCodEmpresa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tDireccion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tPaginaWeb` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodEmpresa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_empresas
-- ----------------------------
INSERT INTO `cat_empresas` VALUES (1, 'Universidad Tecnológica de Aguascalientes', 'Gerónimo de la Cuerva SN, Fracc Villas del Río, Aguascalientes, Ags', 'https://utma.edu.mx', 'AC');

-- ----------------------------
-- Table structure for cat_especies
-- ----------------------------
DROP TABLE IF EXISTS `cat_especies`;
CREATE TABLE `cat_especies`  (
  `eCodEspecie` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodEspecie`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_especies
-- ----------------------------
INSERT INTO `cat_especies` VALUES (1, 'Perro', 'AC');
INSERT INTO `cat_especies` VALUES (2, 'Gato', 'AC');
INSERT INTO `cat_especies` VALUES (3, 'Ave', 'AC');
INSERT INTO `cat_especies` VALUES (4, 'Otro', 'AC');
INSERT INTO `cat_especies` VALUES (5, 'No especificado', 'AC');

-- ----------------------------
-- Table structure for cat_estados
-- ----------------------------
DROP TABLE IF EXISTS `cat_estados`;
CREATE TABLE `cat_estados`  (
  `eCodEstado` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tAbreviatura` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eCodEstado`) USING BTREE,
  UNIQUE INDEX `tNombre`(`tNombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_estados
-- ----------------------------
INSERT INTO `cat_estados` VALUES (1, 'Aguascalientes', 'AGS');
INSERT INTO `cat_estados` VALUES (2, 'Baja California', 'BC');
INSERT INTO `cat_estados` VALUES (3, 'Baja California Sur', 'BCS');
INSERT INTO `cat_estados` VALUES (4, 'Campeche', 'CAM');
INSERT INTO `cat_estados` VALUES (5, 'Coahuila de Zaragoza', 'COA');
INSERT INTO `cat_estados` VALUES (6, 'Colima', 'COL');
INSERT INTO `cat_estados` VALUES (7, 'Chiapas', 'CHP');
INSERT INTO `cat_estados` VALUES (8, 'Chihuahua', 'CHH');
INSERT INTO `cat_estados` VALUES (9, 'Ciudad de México', 'CDMX');
INSERT INTO `cat_estados` VALUES (10, 'Durango', 'DUR');
INSERT INTO `cat_estados` VALUES (11, 'Guanajuato', 'GTO');
INSERT INTO `cat_estados` VALUES (12, 'Guerrero', 'GRO');
INSERT INTO `cat_estados` VALUES (13, 'Hidalgo', 'HGO');
INSERT INTO `cat_estados` VALUES (14, 'Jalisco', 'JAL');
INSERT INTO `cat_estados` VALUES (15, 'México', 'MEX');
INSERT INTO `cat_estados` VALUES (16, 'Michoacán de Ocampo', 'MCH');
INSERT INTO `cat_estados` VALUES (17, 'Morelos', 'MOR');
INSERT INTO `cat_estados` VALUES (18, 'Nayarit', 'NAY');
INSERT INTO `cat_estados` VALUES (19, 'Nuevo León', 'NL');
INSERT INTO `cat_estados` VALUES (20, 'Oaxaca', 'OAX');
INSERT INTO `cat_estados` VALUES (21, 'Puebla', 'PUE');
INSERT INTO `cat_estados` VALUES (22, 'Querétaro', 'QRO');
INSERT INTO `cat_estados` VALUES (23, 'Quintana Roo', 'QR');
INSERT INTO `cat_estados` VALUES (24, 'San Luis Potosí', 'SLP');
INSERT INTO `cat_estados` VALUES (25, 'Sinaloa', 'SIN');
INSERT INTO `cat_estados` VALUES (26, 'Sonora', 'SON');
INSERT INTO `cat_estados` VALUES (27, 'Tabasco', 'TAB');
INSERT INTO `cat_estados` VALUES (28, 'Tamaulipas', 'TMS');
INSERT INTO `cat_estados` VALUES (29, 'Tlaxcala', 'TLX');
INSERT INTO `cat_estados` VALUES (30, 'Veracruz de Ignacio de la Llave', 'VER');
INSERT INTO `cat_estados` VALUES (31, 'Yucatán', 'YUC');
INSERT INTO `cat_estados` VALUES (32, 'Zacatecas', 'ZAC');

-- ----------------------------
-- Table structure for cat_estatus
-- ----------------------------
DROP TABLE IF EXISTS `cat_estatus`;
CREATE TABLE `cat_estatus`  (
  `eCodEstatus` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tNombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tClase` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eCodEstatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_estatus
-- ----------------------------
INSERT INTO `cat_estatus` VALUES (1, 'AC', 'ACTIVO', 'label label-success');
INSERT INTO `cat_estatus` VALUES (2, 'CA', 'CANCELADO', 'label label-warning');
INSERT INTO `cat_estatus` VALUES (3, 'EL', 'ELIMINADO', 'label label-danger');

-- ----------------------------
-- Table structure for cat_estatusmascotas
-- ----------------------------
DROP TABLE IF EXISTS `cat_estatusmascotas`;
CREATE TABLE `cat_estatusmascotas`  (
  `eCodEstatus` int(11) NOT NULL AUTO_INCREMENT,
  `tDescripcion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`eCodEstatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_estatusmascotas
-- ----------------------------
INSERT INTO `cat_estatusmascotas` VALUES (1, 'Disponible');
INSERT INTO `cat_estatusmascotas` VALUES (2, 'Adoptada');
INSERT INTO `cat_estatusmascotas` VALUES (3, 'En tratamiento');
INSERT INTO `cat_estatusmascotas` VALUES (4, 'Reservada');

-- ----------------------------
-- Table structure for cat_eventos
-- ----------------------------
DROP TABLE IF EXISTS `cat_eventos`;
CREATE TABLE `cat_eventos`  (
  `eCodEvento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tNombreCorto` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tIcono` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodEvento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_eventos
-- ----------------------------
INSERT INTO `cat_eventos` VALUES (1, 'Registro de datos', 'Registro', '<i class=\"fa fa-plus fa-fw text-success text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (2, 'Actualización de datos', 'Actualización', '<i class=\"fa fa-pencil fa-fw text-warning text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (3, 'Eliminación de datos', 'Eliminación', '<i class=\"fa fa-ban fa-fw text-danger text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (4, 'Consulta de información', 'Información', '<i class=\"fa fa-info fa-fw text-info text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (5, 'Impresión de PDF', 'PDF', '<i class=\"fa fa-file-pdf-o fa-fw text-muted text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (6, 'Exportación de Excel', 'Excel', '<i class=\"fa fa-file-excel-o fa-fw text-muted text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (7, 'Error de Sistema', 'Error', '<i class=\"fa fa-times-circle fa-fw text-danger text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (8, 'Logeo de Sistema', 'Logeo', '<i class=\"fa  fa-key fa-fw text-success text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (9, 'Navegación en Sistema', 'Navegación', '<i class=\"fa fa-globe fa-fw text-muted text-md va-middle\"></i>', 'AC');

-- ----------------------------
-- Table structure for cat_generos
-- ----------------------------
DROP TABLE IF EXISTS `cat_generos`;
CREATE TABLE `cat_generos`  (
  `eCodGenero` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodGenero`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_generos
-- ----------------------------
INSERT INTO `cat_generos` VALUES (1, 'Masculino');
INSERT INTO `cat_generos` VALUES (2, 'Femenino');
INSERT INTO `cat_generos` VALUES (3, 'No Especificó');
INSERT INTO `cat_generos` VALUES (4, 'Otros');

-- ----------------------------
-- Table structure for cat_interesados
-- ----------------------------
DROP TABLE IF EXISTS `cat_interesados`;
CREATE TABLE `cat_interesados`  (
  `eCodInteresado` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tApellidoPaterno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tApellidoMaterno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tTelefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tCorreo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tDireccion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eCodCiudad` int(11) NOT NULL,
  `eCodEstado` int(11) NOT NULL,
  `tPreferenciaMascota` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Cualquiera',
  `tMotivoContacto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Interesado en adoptar',
  `tEstadoSolicitud` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Nuevo',
  `tNotas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fhRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodInteresado`) USING BTREE,
  INDEX `eCodCiudad`(`eCodCiudad`) USING BTREE,
  INDEX `eCodEstado`(`eCodEstado`) USING BTREE,
  CONSTRAINT `cat_interesados_ibfk_1` FOREIGN KEY (`eCodCiudad`) REFERENCES `cat_ciudades` (`eCodCiudad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cat_interesados_ibfk_2` FOREIGN KEY (`eCodEstado`) REFERENCES `cat_estados` (`eCodEstado`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_interesados
-- ----------------------------
INSERT INTO `cat_interesados` VALUES (1, 'DIEGO', 'MARTINEZ', 'LOZADA', '(449) 28 82314', 'utm22030701@utma.edu.mx', 'Residencial Las plazas', 2, 1, 'Otro', 'Interesado en adoptar', 'Nuevo', NULL, '2025-11-30 22:13:39', 'AC');
INSERT INTO `cat_interesados` VALUES (2, 'ERICK', 'MARTINEZ', 'LOZADA', '(449) 91 13575', 'Zlambo13@gmail.com', 'Residencial Las plazas', 14, 30, 'Perro', 'Información', 'Nuevo', 'Ninguna', '2025-11-30 22:17:29', 'AC');

-- ----------------------------
-- Table structure for cat_items
-- ----------------------------
DROP TABLE IF EXISTS `cat_items`;
CREATE TABLE `cat_items`  (
  `eCodItem` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eCodTipoItem` int(11) NOT NULL,
  `tDescripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dPrecio` double(11, 2) NOT NULL,
  `fhFechaRegistro` datetime NOT NULL,
  `tCodEstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodItem`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_items
-- ----------------------------
INSERT INTO `cat_items` VALUES (1, 'Piña', 1, 'Es una fruta deliciosa', 25.00, '2024-05-24 16:49:50', 'AC');
INSERT INTO `cat_items` VALUES (2, 'Brócoli', 2, 'Es una verdura nutritiva', 40.00, '2024-05-24 16:50:16', 'AC');
INSERT INTO `cat_items` VALUES (3, 'a', 2, 'a', 15.00, '2024-05-24 23:48:15', 'AC');
INSERT INTO `cat_items` VALUES (4, 'b', 1, 'b', 21.00, '2024-05-24 23:51:40', 'EL');
INSERT INTO `cat_items` VALUES (5, 'c', 3, 'c', 621.00, '2024-05-24 23:55:32', 'CA');

-- ----------------------------
-- Table structure for cat_marcas
-- ----------------------------
DROP TABLE IF EXISTS `cat_marcas`;
CREATE TABLE `cat_marcas`  (
  `eCodMarca` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodMarca`) USING BTREE,
  UNIQUE INDEX `tNombre`(`tNombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_marcas
-- ----------------------------
INSERT INTO `cat_marcas` VALUES (1, 'Pedigree', 'AC');
INSERT INTO `cat_marcas` VALUES (2, 'Purina', 'AC');
INSERT INTO `cat_marcas` VALUES (3, 'Dog Chow', 'AC');
INSERT INTO `cat_marcas` VALUES (4, 'Cat Chow', 'AC');
INSERT INTO `cat_marcas` VALUES (5, 'Royal Canin', 'AC');
INSERT INTO `cat_marcas` VALUES (6, 'Hills', 'AC');
INSERT INTO `cat_marcas` VALUES (7, 'Bayer', 'AC');
INSERT INTO `cat_marcas` VALUES (8, 'Zoetis', 'AC');
INSERT INTO `cat_marcas` VALUES (9, 'Virbac', 'AC');
INSERT INTO `cat_marcas` VALUES (10, 'Frontline', 'AC');
INSERT INTO `cat_marcas` VALUES (11, 'Advocate', 'AC');
INSERT INTO `cat_marcas` VALUES (12, 'Whiskas', 'AC');
INSERT INTO `cat_marcas` VALUES (13, 'Kong', 'AC');
INSERT INTO `cat_marcas` VALUES (14, 'NexGard', 'AC');
INSERT INTO `cat_marcas` VALUES (15, 'Eukanuba', 'AC');

-- ----------------------------
-- Table structure for cat_mascotas
-- ----------------------------
DROP TABLE IF EXISTS `cat_mascotas`;
CREATE TABLE `cat_mascotas`  (
  `eCodMascota` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eEdad` int(11) NOT NULL,
  `dPeso` decimal(5, 2) NULL DEFAULT NULL,
  `tEnfermedad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tDescripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tFoto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `eCodEspecie` int(11) NULL DEFAULT NULL,
  `eCodRaza` int(11) NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  `fhFechaRegistro` datetime NOT NULL,
  `fhFechaActualizacion` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`eCodMascota`) USING BTREE,
  INDEX `eCodEspecie`(`eCodEspecie`) USING BTREE,
  INDEX `eCodRaza`(`eCodRaza`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_mascotas
-- ----------------------------
INSERT INTO `cat_mascotas` VALUES (1, 'Firulais', 2, 2.50, 'Ninguna', 'Prueba de escritura', 'images/mascotas/Cane_da_pastore_tedesco_adulto.jpg', 1, 3, 'AC', '0000-00-00 00:00:00', NULL);
INSERT INTO `cat_mascotas` VALUES (3, 'Lucky', 5, 3.00, 'Ninguno', 'Bola de pelos', 'images/mascotas/Pomeranian5.jpg', 1, 14, 'AC', '0000-00-00 00:00:00', NULL);
INSERT INTO `cat_mascotas` VALUES (4, 'Poli', 3, 10.00, 'Ninguno', 'Una perrila muy alocada y con un gran corazon y muy activa', 'images/mascotas/Poli.jpg', 1, 1, 'AC', '0000-00-00 00:00:00', NULL);
INSERT INTO `cat_mascotas` VALUES (5, 'GIACOMINO,GUARDIANO DELLE GALASSIE E DELL\'IPERSPAZIO', 2, 2.00, 'Ninguno', 'Un Gato Cosmico', 'images/mascotas/Gato.jpeg', 2, 21, 'AC', '0000-00-00 00:00:00', NULL);
INSERT INTO `cat_mascotas` VALUES (6, 'Snowy', 1, 1.00, 'Ninguno', 'Conejo muy hermoso y chiquito. Es hembra', 'images/mascotas/Snowy.jpg', 4, 45, 'AC', '2025-11-30 06:04:47', '2025-11-30 06:09:09');

-- ----------------------------
-- Table structure for cat_modulos
-- ----------------------------
DROP TABLE IF EXISTS `cat_modulos`;
CREATE TABLE `cat_modulos`  (
  `eCodModulo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tCodModulo` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ePosicion` int(11) NOT NULL,
  `tControlador` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tIcono` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tNombreCorto` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eCodModulo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_modulos
-- ----------------------------
INSERT INTO `cat_modulos` VALUES (1, 'm1', 1, 'Configuracion', 'fa fa-cogs', 'CONFIGURACION', 'CONFIGURACION');
INSERT INTO `cat_modulos` VALUES (2, 'm2', 2, 'Usuario', 'fa fa-users', 'USUARIOS', 'USUARIOS');
INSERT INTO `cat_modulos` VALUES (3, 'm3', 3, 'Mascota', 'fa fa-paw', 'MASCOTAS', 'MASCOTAS');
INSERT INTO `cat_modulos` VALUES (4, 'm4', 4, 'Adopcion', 'fa fa-heart', 'ADOPCIONES', 'ADOPCIONES');
INSERT INTO `cat_modulos` VALUES (5, 'm5', 5, 'Interesado', 'fa fa-user-plus', 'INTERESADOS', 'INTERESADOS');
INSERT INTO `cat_modulos` VALUES (6, 'm6', 6, 'Cita', 'fa fa-calendar', 'CITAS', 'CITAS');
INSERT INTO `cat_modulos` VALUES (7, 'm7', 7, 'Salud', 'fa fa-medkit', 'SALUD Y VACUNAS', 'SALUD');
INSERT INTO `cat_modulos` VALUES (8, 'm8', 8, 'Inventario', 'fa fa-cubes', 'INVENTARIO DEL REFUGIO', 'INVENTARIO');
INSERT INTO `cat_modulos` VALUES (9, 'm9', 9, 'Finanza', 'fa fa-money', 'DONACIONES Y FINANZAS', 'FINANZAS');

-- ----------------------------
-- Table structure for cat_motivos_movimiento
-- ----------------------------
DROP TABLE IF EXISTS `cat_motivos_movimiento`;
CREATE TABLE `cat_motivos_movimiento`  (
  `eCodMotivo` int(11) NOT NULL AUTO_INCREMENT,
  `tMotivo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tDescripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tNaturaleza` enum('Entrada','Salida') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`eCodMotivo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_motivos_movimiento
-- ----------------------------
INSERT INTO `cat_motivos_movimiento` VALUES (1, 'Donación', 'Ingreso de insumos donados por ciudadanos o asociaciones.', 'Entrada');
INSERT INTO `cat_motivos_movimiento` VALUES (2, 'Compra', 'Entrada de productos comprados a proveedores.', 'Entrada');
INSERT INTO `cat_motivos_movimiento` VALUES (3, 'Ajuste por inventario', 'Corrección derivada del conteo o auditoría.', 'Entrada');
INSERT INTO `cat_motivos_movimiento` VALUES (4, 'Devolución', 'Material regresado por un adoptante o usuario.', 'Entrada');
INSERT INTO `cat_motivos_movimiento` VALUES (5, 'Uso clínico', 'Productos usados en consultas o cirugías.', 'Salida');
INSERT INTO `cat_motivos_movimiento` VALUES (6, 'Entrega a adoptante', 'Artículos incluidos en el kit de adopción.', 'Salida');
INSERT INTO `cat_motivos_movimiento` VALUES (7, 'Caducidad', 'Producto vencido que debe desecharse.', 'Salida');
INSERT INTO `cat_motivos_movimiento` VALUES (8, 'Merma', 'Daño, deterioro o pérdida.', 'Salida');
INSERT INTO `cat_motivos_movimiento` VALUES (9, 'Transferencia interna', 'Movimiento entre áreas del refugio.', 'Salida');

-- ----------------------------
-- Table structure for cat_perfiles
-- ----------------------------
DROP TABLE IF EXISTS `cat_perfiles`;
CREATE TABLE `cat_perfiles`  (
  `eCodPerfil` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodPerfil`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_perfiles
-- ----------------------------
INSERT INTO `cat_perfiles` VALUES (1, 'SuperAdministrador', 'AC');
INSERT INTO `cat_perfiles` VALUES (2, 'Director', 'AC');
INSERT INTO `cat_perfiles` VALUES (3, 'Usuario Normal', 'AC');
INSERT INTO `cat_perfiles` VALUES (4, 'Capturistas', 'AC');

-- ----------------------------
-- Table structure for cat_permisos
-- ----------------------------
DROP TABLE IF EXISTS `cat_permisos`;
CREATE TABLE `cat_permisos`  (
  `eCodPermiso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodSeccion` int(11) UNSIGNED NOT NULL,
  `tCodPermiso` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ePosicion` int(11) NULL DEFAULT NULL,
  `tNombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tBoton` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aEstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eCodPermiso`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_permisos
-- ----------------------------
INSERT INTO `cat_permisos` VALUES (1, 1, 'm1_s1_p1', 1, 'Filtrar', '<button type=\'button\' class=\'btn btn-lg btn-info\' onclick=\'filtrar();\'><i class=\'fa fa-search-o\'></i> Filtrar</button>', NULL);
INSERT INTO `cat_permisos` VALUES (2, 3, 'm2_s1_p1', 1, 'Guardar', '<button type=\'button\' class=\'btn btn-lg btn-success\' onclick=\'guardar(this);\'><i class=\'fa fa-save\'></i> Guardar</button>', NULL);
INSERT INTO `cat_permisos` VALUES (3, 4, 'm2_s2_p1', NULL, 'Detalle de Información', '<a title=\'Detalle\' href=\'#divInfo\' onclick=\'info($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn btn-sm btn-default\'><i class=\'fa fa-info-circle\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (5, 4, 'm2_s2_p3', NULL, 'Eliminar', '<a title=\'Eliminar\' href=\'#divEliminar\' onclick=\'eliminar($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn-sm btn btn-default\'><i class=\'fa fa-trash-o\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (6, 4, 'm2_s2_p4', NULL, 'Cambiar Password', '<a title=\'Cambiar Password\' href=\'#divPassword\' onclick=\'password_id($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn btn-sm btn-default\'><i class=\'fa fa-key\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (7, 4, 'm2_s2_p5', NULL, 'Editar', '<button title=\'Editar\' type=\'button\' class=\'btn btn-sm btn-default\' onclick=\'editar($(this).parent());\' data-toggle=\'tooltip\'><i class=\'fa fa-pencil\'></i></button>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (8, 5, 'm2_s3_p1', NULL, 'Nuevo', '<button type=\'button\' class=\'btn btn-lg btn-default\' onclick=\'nuevo();\'><i class=\'fa fa-plus\'></i> Nuevo</button>', NULL);
INSERT INTO `cat_permisos` VALUES (9, 5, 'm2_s3_p2', NULL, 'Editar', '<button type=\'button\' class=\'btn btn-lg btn-default\' onclick=\'editar();\'><i class=\'fa fa-pencil\'></i> Editar</button>', NULL);
INSERT INTO `cat_permisos` VALUES (10, 6, 'm3_s1_p1', 1, 'Guardar', '<button type=\'button\' class=\'btn btn-lg btn-success\' onclick=\'guardar(this);\'><i class=\'fa fa-save\'></i> Guardar</button>', NULL);
INSERT INTO `cat_permisos` VALUES (11, 7, 'm3_s2_p1', NULL, 'Detalle de Información', '<a title=\'Detalle\' href=\'#divInfo\' onclick=\'info($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn btn-sm btn-default\'><i class=\'fa fa-info-circle\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (12, 7, 'm3_s2_p2', 3, 'Eliminar', '<a title=\'Detalle\' href=\'#\' onclick=\'eliminar_mascota($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn btn-sm btn-default\'><i class=\'fa fa-trash-o\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (13, 7, 'm3_s2_p3', NULL, 'Editar', '<button title=\'Editar\' type=\'button\' class=\'btn btn-sm btn-default\' onclick=\'editar($(this).parent());\' data-toggle=\'tooltip\'><i class=\'fa fa-pencil\'></i></button>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (38, 8, 'm4_s1_p1', NULL, 'Consultar Registro Adopción', 'tBotonHTML_Aqui', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (39, 9, 'm4_s2_p1', NULL, 'Consultar Historial Adopciones', 'tBotonHTML_Aqui', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (40, 10, 'm4_s3_p1', NULL, 'Consultar Seguimiento', 'tBotonHTML_Aqui', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (41, 11, 'm5_s1_p1', NULL, 'Consultar Registro Interesado', 'tBotonHTML_Aqui', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (42, 12, 'm5_s2_p1', NULL, 'Editar', '<button title=\'Editar\' type=\'button\' class=\'btn btn-sm btn-default\' onclick=\'editar($(this).parent());\' data-toggle=\'tooltip\'><i class=\'fa fa-pencil\'></i></button>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (43, 13, 'm6_s1_p1', NULL, 'Consultar Programar Cita', 'tBotonHTML_Aqui', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (44, 14, 'm6_s2_p1', NULL, 'Consultar Listado Citas', 'tBotonHTML_Aqui', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (45, 15, 'm7_s1_p1', NULL, 'Consultar Historial Médico', 'tBotonHTML_Aqui', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (46, 16, 'm7_s2_p1', NULL, 'Consultar Vacunas y Tratamientos', 'tBotonHTML_Aqui', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (47, 17, 'm8_s1_p1', NULL, 'Consultar Movimientos de Inventario', 'tBotonHTML_Aqui', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (48, 18, 'm8_s2_p1', NULL, 'Consultar Gestión de Productos', 'tBotonHTML_Aqui', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (49, 19, 'm9_s1_p1', NULL, 'Eliminar', '<a title=\'Detalle\' href=\'#\' onclick=\'eliminar_donador($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn btn-sm btn-default\'><i class=\'fa fa-trash-o\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (50, 20, 'm8_s3_p1', NULL, 'Consultar Nuevo Productos', '<button type=\'button\' class=\'btn btn-lg btn-success\' onclick=\'guardar(this);\'><i class=\'fa fa-save\'></i> Guardar</button>', 'tEstatus_Aqui');
INSERT INTO `cat_permisos` VALUES (51, 19, 'm9_si_p2', NULL, 'Editar', '<button title=\'Editar\' type=\'button\' class=\'btn btn-sm btn-default\' onclick=\'editar($(this).parent());\' data-toggle=\'tooltip\'><i class=\'fa fa-pencil\'></i></button>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (52, 12, 'm5_s2_p2', NULL, 'Eliminar', '<a title=\'Detalle\' href=\'#\' onclick=\'eliminar($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn btn-sm btn-default\'><i class=\'fa fa-trash-o\'></i></a>', 'AC,CA,EL');

-- ----------------------------
-- Table structure for cat_productos
-- ----------------------------
DROP TABLE IF EXISTS `cat_productos`;
CREATE TABLE `cat_productos`  (
  `eCodProducto` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tDescripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `eCodCategoriaProductos` int(11) NULL DEFAULT NULL,
  `eCodProveedor` int(11) NULL DEFAULT NULL,
  `eCodMarca` int(11) NULL DEFAULT NULL,
  `tUnidad` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nPrecioCompra` decimal(10, 2) NULL DEFAULT NULL,
  `nStockMinimo` int(11) NULL DEFAULT 5,
  `tCodEstatus` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AC',
  `fRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eCodProducto`) USING BTREE,
  INDEX `eCodCategoriaProductos`(`eCodCategoriaProductos`) USING BTREE,
  INDEX `eCodProveedor`(`eCodProveedor`) USING BTREE,
  INDEX `eCodMarca`(`eCodMarca`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_productos
-- ----------------------------
INSERT INTO `cat_productos` VALUES (1, 'Croquetas Adulto Razas Medianas', 'Alimento seco balanceado para perros adultos, razas medianas', 1, 6, 3, '20Kg', 850.00, 5, 'AC', '2025-11-18 08:07:58');

-- ----------------------------
-- Table structure for cat_proveedores
-- ----------------------------
DROP TABLE IF EXISTS `cat_proveedores`;
CREATE TABLE `cat_proveedores`  (
  `eCodProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tTelefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tCorreo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tDireccion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodProveedor`) USING BTREE,
  UNIQUE INDEX `tNombre`(`tNombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_proveedores
-- ----------------------------
INSERT INTO `cat_proveedores` VALUES (1, 'Purina México', '555-123-4567', 'contacto@purina.mx', 'Av. Industria 120, CDMX', 'AC');
INSERT INTO `cat_proveedores` VALUES (2, 'Bayer Animal Health', '555-987-6543', 'ventas@bayer-animal.com', 'Blvd. Salud 200, CDMX', 'AC');
INSERT INTO `cat_proveedores` VALUES (3, 'Pedigree Distribuidores', '555-222-3366', 'pedigree@ventas.mx', 'Calle Mascotas 45, Guadalajara', 'AC');
INSERT INTO `cat_proveedores` VALUES (4, 'Distribuidora VetPlus', '333-556-8899', 'info@vetplus.com', 'Av. Veterinaria 800, Monterrey', 'AC');
INSERT INTO `cat_proveedores` VALUES (5, 'Zoetis México', '555-888-9900', 'clientes@zoetis.mx', 'Calle Bienestar 99, CDMX', 'AC');
INSERT INTO `cat_proveedores` VALUES (6, 'Royal Canin México', '444-123-8899', 'contacto@royalcanin.mx', 'Av. Nutripet 67, Querétaro', 'AC');
INSERT INTO `cat_proveedores` VALUES (7, 'PetLine Proveedores', '777-987-1122', 'ventas@petline.com', 'Calle Comercio 10, Puebla', 'AC');
INSERT INTO `cat_proveedores` VALUES (8, 'Virbac Salud Animal', '555-761-4555', 'contact@virbac.mx', 'Av. Ciencia 300, CDMX', 'AC');

-- ----------------------------
-- Table structure for cat_razas
-- ----------------------------
DROP TABLE IF EXISTS `cat_razas`;
CREATE TABLE `cat_razas`  (
  `eCodRaza` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eCodEspecie` int(11) NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodRaza`) USING BTREE,
  INDEX `eCodEspecie`(`eCodEspecie`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_razas
-- ----------------------------
INSERT INTO `cat_razas` VALUES (1, 'Mestizo (Perro)', 1, 'AC');
INSERT INTO `cat_razas` VALUES (2, 'Labrador Retriever', 1, 'AC');
INSERT INTO `cat_razas` VALUES (3, 'Pastor Alemán', 1, 'AC');
INSERT INTO `cat_razas` VALUES (4, 'Golden Retriever', 1, 'AC');
INSERT INTO `cat_razas` VALUES (5, 'Bulldog Francés', 1, 'AC');
INSERT INTO `cat_razas` VALUES (6, 'Poodle (Caniche)', 1, 'AC');
INSERT INTO `cat_razas` VALUES (7, 'Chihuahua', 1, 'AC');
INSERT INTO `cat_razas` VALUES (8, 'Pug', 1, 'AC');
INSERT INTO `cat_razas` VALUES (9, 'Schnauzer', 1, 'AC');
INSERT INTO `cat_razas` VALUES (10, 'Shih Tzu', 1, 'AC');
INSERT INTO `cat_razas` VALUES (11, 'Bóxer', 1, 'AC');
INSERT INTO `cat_razas` VALUES (12, 'Rottweiler', 1, 'AC');
INSERT INTO `cat_razas` VALUES (13, 'Beagle', 1, 'AC');
INSERT INTO `cat_razas` VALUES (14, 'Pomerania', 1, 'AC');
INSERT INTO `cat_razas` VALUES (15, 'Dóberman', 1, 'AC');
INSERT INTO `cat_razas` VALUES (16, 'Gran Danés', 1, 'AC');
INSERT INTO `cat_razas` VALUES (17, 'Husky Siberiano', 1, 'AC');
INSERT INTO `cat_razas` VALUES (18, 'Pastor Australiano', 1, 'AC');
INSERT INTO `cat_razas` VALUES (19, 'Yorkshire Terrier', 1, 'AC');
INSERT INTO `cat_razas` VALUES (20, 'Dachshund (Salchicha)', 1, 'AC');
INSERT INTO `cat_razas` VALUES (21, 'Mestizo (Gato)', 2, 'AC');
INSERT INTO `cat_razas` VALUES (22, 'Común Europeo', 2, 'AC');
INSERT INTO `cat_razas` VALUES (23, 'Siamés', 2, 'AC');
INSERT INTO `cat_razas` VALUES (24, 'Persa', 2, 'AC');
INSERT INTO `cat_razas` VALUES (25, 'Maine Coon', 2, 'AC');
INSERT INTO `cat_razas` VALUES (26, 'Ragdoll', 2, 'AC');
INSERT INTO `cat_razas` VALUES (27, 'Bengala', 2, 'AC');
INSERT INTO `cat_razas` VALUES (28, 'Esfinge (Sphynx)', 2, 'AC');
INSERT INTO `cat_razas` VALUES (29, 'British Shorthair', 2, 'AC');
INSERT INTO `cat_razas` VALUES (30, 'American Shorthair', 2, 'AC');
INSERT INTO `cat_razas` VALUES (31, 'Azul Ruso', 2, 'AC');
INSERT INTO `cat_razas` VALUES (32, 'Scottish Fold', 2, 'AC');
INSERT INTO `cat_razas` VALUES (33, 'Siberiano', 2, 'AC');
INSERT INTO `cat_razas` VALUES (34, 'Hámster Sirio', 3, 'AC');
INSERT INTO `cat_razas` VALUES (35, 'Cuyo (Cobaya)', 3, 'AC');
INSERT INTO `cat_razas` VALUES (36, 'Hámster Ruso', 3, 'AC');
INSERT INTO `cat_razas` VALUES (37, 'Jerbo', 3, 'AC');
INSERT INTO `cat_razas` VALUES (38, 'No Aplica', 4, 'AC');
INSERT INTO `cat_razas` VALUES (39, 'Conejo Belier', 4, 'AC');
INSERT INTO `cat_razas` VALUES (40, 'Conejo Cabeza de León', 4, 'AC');
INSERT INTO `cat_razas` VALUES (41, 'Perico Australiano', 4, 'AC');
INSERT INTO `cat_razas` VALUES (42, 'Tortuga de orejas rojas', 4, 'AC');
INSERT INTO `cat_razas` VALUES (43, 'No especificado', 5, 'AC');
INSERT INTO `cat_razas` VALUES (44, 'Otro', 4, 'AC');
INSERT INTO `cat_razas` VALUES (45, 'Conejo Holandes', 4, 'AC');

-- ----------------------------
-- Table structure for cat_roles
-- ----------------------------
DROP TABLE IF EXISTS `cat_roles`;
CREATE TABLE `cat_roles`  (
  `eCodRol` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`eCodRol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_roles
-- ----------------------------
INSERT INTO `cat_roles` VALUES (1, 'Administrador');
INSERT INTO `cat_roles` VALUES (2, 'Empleado');
INSERT INTO `cat_roles` VALUES (3, 'Voluntario');

-- ----------------------------
-- Table structure for cat_secciones
-- ----------------------------
DROP TABLE IF EXISTS `cat_secciones`;
CREATE TABLE `cat_secciones`  (
  `eCodSeccion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodModulo` int(10) UNSIGNED NOT NULL,
  `tCodSeccion` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ePosicion` int(11) NULL DEFAULT NULL,
  `tIcono` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tNombreCorto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodSeccion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_secciones
-- ----------------------------
INSERT INTO `cat_secciones` VALUES (1, 1, 'm1_s1', 1, 'fa fa-bug', 'Log Evento', 'LogEvento');
INSERT INTO `cat_secciones` VALUES (3, 2, 'm2_s1', 1, 'fa fa-plus-square', 'Nuevo', 'Nuevo');
INSERT INTO `cat_secciones` VALUES (4, 2, 'm2_s2', 2, 'fa fa-list-alt', 'Listado', 'Listado');
INSERT INTO `cat_secciones` VALUES (5, 2, 'm2_s3', 3, 'fa fa-users', 'Perfiles', 'Perfiles');
INSERT INTO `cat_secciones` VALUES (6, 3, 'm3_s1', 1, 'fa fa-plus-square', 'Nuevo', 'Nuevo');
INSERT INTO `cat_secciones` VALUES (7, 3, 'm3_s2', 2, 'fa fa-list-alt', 'Listado', 'Listado');
INSERT INTO `cat_secciones` VALUES (8, 4, 'm4_s1', 1, 'fa fa-plus-square', 'Registrar Adopción', 'Nuevo');
INSERT INTO `cat_secciones` VALUES (9, 4, 'm4_s2', 2, 'fa fa-list-alt', 'Historial de Adopciones', 'Listado');
INSERT INTO `cat_secciones` VALUES (10, 4, 'm4_s3', 3, 'fa fa-user-circle', 'Seguimiento Post-Adopción', 'Seguimiento');
INSERT INTO `cat_secciones` VALUES (11, 5, 'm5_s1', 1, 'fa fa-user-square', 'Nuevo Interesado', 'Nuevo');
INSERT INTO `cat_secciones` VALUES (12, 5, 'm5_s2', 2, 'fa fa-list-alt', 'Listado de Interesados', 'Listado');
INSERT INTO `cat_secciones` VALUES (13, 6, 'm6_s1', 1, 'fa fa-calendar-plus-o', 'Programar Cita', 'Programar');
INSERT INTO `cat_secciones` VALUES (14, 6, 'm6_s2', 2, 'fa fa-list-alt', 'Listado de Citas', 'Listado');
INSERT INTO `cat_secciones` VALUES (15, 7, 'm7_s1', 1, 'fa fa-stethoscope', 'Historial Médico', 'Historial');
INSERT INTO `cat_secciones` VALUES (16, 7, 'm7_s2', 2, 'fa fa-medkit', 'Vacunas y Tratamientos', 'Vacunas');
INSERT INTO `cat_secciones` VALUES (17, 8, 'm8_s1', 1, 'fa fa-exchange', 'Movimientos (Entradas/Salidas)', 'Movimientos');
INSERT INTO `cat_secciones` VALUES (18, 8, 'm8_s2', 2, 'fa fa-tag', 'Gestión de Productos', 'Productos');
INSERT INTO `cat_secciones` VALUES (19, 9, 'm9_s1', 1, 'fa fa-money', 'Donaciones Monetarias', 'Donaciones');
INSERT INTO `cat_secciones` VALUES (20, 8, 'm8_s3', 3, 'fa fa-plus-square', 'Nuevo', 'Nuevo');
INSERT INTO `cat_secciones` VALUES (21, 8, 'm8_s4', 4, '', 'Actualizar', 'Actualizar');
INSERT INTO `cat_secciones` VALUES (22, 9, 'm9_s2', 2, '', 'Nuevo', 'Nuevo');

-- ----------------------------
-- Table structure for cat_tipositems
-- ----------------------------
DROP TABLE IF EXISTS `cat_tipositems`;
CREATE TABLE `cat_tipositems`  (
  `eCodTipoItem` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tCodEstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodTipoItem`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_tipositems
-- ----------------------------
INSERT INTO `cat_tipositems` VALUES (1, 'Fruta', 'AC');
INSERT INTO `cat_tipositems` VALUES (2, 'Verdura', 'AC');
INSERT INTO `cat_tipositems` VALUES (3, 'Mueble', 'AC');
INSERT INTO `cat_tipositems` VALUES (4, 'Otros', 'AC');

-- ----------------------------
-- Table structure for cat_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `cat_usuarios`;
CREATE TABLE `cat_usuarios`  (
  `eCodUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodEmpresa` int(11) NULL DEFAULT NULL,
  `eCodDepartamento` int(10) UNSIGNED NULL DEFAULT NULL,
  `tTelefono` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eCodPerfil` int(10) UNSIGNED NOT NULL,
  `bAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `tNombre` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tCorreo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tUsuario` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tPassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eCodPersona` int(11) NULL DEFAULT NULL,
  `tPuesto` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tImagen` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fhFechaRegistro` datetime NOT NULL,
  `fhFechaActualizacion` datetime NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodUsuario`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_usuarios
-- ----------------------------
INSERT INTO `cat_usuarios` VALUES (1, 1, 1, '(449) 28 82314', 1, 1, 'Diego Martinez', 'utm22030701@utma.edu.mx', 'dmartinez', 'd5fa077fbeb95f8127f53862c8a666d75442e1f4', NULL, 'SuperAdmin', 'images/usuarios/user_man1.jpg', '2024-05-23 10:26:22', '2025-11-03 13:56:26', 'AC');
INSERT INTO `cat_usuarios` VALUES (2, 1, 2, '(449) 12 34321', 2, 1, 'Admin', 'director@utma.edu.mx', 'director', '5c8e6e9cb80f09a1faab30a61b6fbf7c838205b9', NULL, 'Director General', 'images/usuarios/user_man1.jpg', '2024-05-23 11:29:19', '2024-05-23 16:21:33', 'AC');
INSERT INTO `cat_usuarios` VALUES (3, 1, 3, '(449) 78 96541', 3, 0, 'Usuario Normal', 'prueba@utma.edu.mx', 'usuario', '5c8e6e9cb80f09a1faab30a61b6fbf7c838205b9', NULL, 'Usuario Normal', 'images/usuarios/user_man1.jpg', '2024-05-23 12:01:51', '2024-05-23 16:33:53', 'AC');
INSERT INTO `cat_usuarios` VALUES (4, 1, 1, '(449) 95 13573', 3, 0, 'Prueba 2', 'a@utma.edu.mx', 'prueba2', '5c8e6e9cb80f09a1faab30a61b6fbf7c838205b9', NULL, 'Otro', 'images/usuarios/user_man1.jpg', '2024-05-24 23:57:28', '2024-05-25 00:22:03', 'AC');

-- ----------------------------
-- Table structure for cat_vacunas
-- ----------------------------
DROP TABLE IF EXISTS `cat_vacunas`;
CREATE TABLE `cat_vacunas`  (
  `eCodVacuna` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tDescripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`eCodVacuna`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_vacunas
-- ----------------------------

-- ----------------------------
-- Table structure for cog_correos
-- ----------------------------
DROP TABLE IF EXISTS `cog_correos`;
CREATE TABLE `cog_correos`  (
  `eCodCorreo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodEmpresa` int(10) UNSIGNED NOT NULL,
  `tProtocolo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tHost` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tPuerto` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tUsuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tPassword` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tEncabezado` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tPie` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodCorreo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cog_correos
-- ----------------------------

-- ----------------------------
-- Table structure for pro_adopciones
-- ----------------------------
DROP TABLE IF EXISTS `pro_adopciones`;
CREATE TABLE `pro_adopciones`  (
  `eCodAdopcion` int(11) NOT NULL AUTO_INCREMENT,
  `eCodMascota` int(11) NULL DEFAULT NULL,
  `eCodInteresado` int(11) NULL DEFAULT NULL,
  `fhFecha` date NOT NULL,
  `tMotivo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`eCodAdopcion`) USING BTREE,
  INDEX `eCodMascota`(`eCodMascota`) USING BTREE,
  INDEX `eCodInteresado`(`eCodInteresado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_adopciones
-- ----------------------------
INSERT INTO `pro_adopciones` VALUES (1, 5, 1, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (2, 5, 2, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (3, 5, 3, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (4, 5, 4, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (5, 1, 5, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (6, 1, 6, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (7, 1, 7, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (8, 4, 8, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (9, 3, 9, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (10, 3, 10, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (11, 5, 11, '2025-11-30', '');
INSERT INTO `pro_adopciones` VALUES (12, 5, 12, '2025-12-01', '');
INSERT INTO `pro_adopciones` VALUES (13, 5, 1, '2025-12-01', '');
INSERT INTO `pro_adopciones` VALUES (14, 1, 1, '2025-12-01', '');
INSERT INTO `pro_adopciones` VALUES (15, 6, 2, '2025-12-01', '');
INSERT INTO `pro_adopciones` VALUES (16, 3, 1, '2025-12-01', '');

-- ----------------------------
-- Table structure for pro_citas
-- ----------------------------
DROP TABLE IF EXISTS `pro_citas`;
CREATE TABLE `pro_citas`  (
  `eCodCita` int(11) NOT NULL AUTO_INCREMENT,
  `eCodInteresado` int(11) NOT NULL,
  `eCodMascota` int(11) NOT NULL,
  `fhFechaHora` datetime NOT NULL,
  `tMotivo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tTipoCita` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Adopción',
  `eCodUsuario` int(11) NULL DEFAULT NULL,
  `fhCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fhActualizacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodCita`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_citas
-- ----------------------------
INSERT INTO `pro_citas` VALUES (1, 1, 6, '2025-12-03 15:01:00', 'Prueba2', 'Adopcion', 1, '2025-12-01 00:02:23', '2025-12-01 01:06:39', 'AC');

-- ----------------------------
-- Table structure for pro_donaciones
-- ----------------------------
DROP TABLE IF EXISTS `pro_donaciones`;
CREATE TABLE `pro_donaciones`  (
  `eCodDonacion` int(11) NOT NULL AUTO_INCREMENT,
  `eCodDonador` int(11) NULL DEFAULT NULL,
  `dMonto` decimal(10, 2) NULL DEFAULT NULL,
  `tDescripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fhFecha` date NULL DEFAULT NULL,
  PRIMARY KEY (`eCodDonacion`) USING BTREE,
  INDEX `eCodDonador`(`eCodDonador`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_donaciones
-- ----------------------------

-- ----------------------------
-- Table structure for pro_logseventos
-- ----------------------------
DROP TABLE IF EXISTS `pro_logseventos`;
CREATE TABLE `pro_logseventos`  (
  `eCodLogEvento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodUsuario` int(10) UNSIGNED NOT NULL,
  `eCodEvento` int(11) NULL DEFAULT NULL,
  `tEvento` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fhFechaRegistro` datetime NOT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodLogEvento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_logseventos
-- ----------------------------
INSERT INTO `pro_logseventos` VALUES (1, 1, 1, 'La mascota: Firulais 2 fue registrada con éxito', '2025-10-28 01:00:09', 'AC');
INSERT INTO `pro_logseventos` VALUES (2, 1, 1, 'La mascota: Firulais fue registrada con éxito', '2025-10-28 01:15:11', 'AC');
INSERT INTO `pro_logseventos` VALUES (3, 1, 2, 'Se actualizó la Mascota con Id #1', '2025-10-28 02:32:35', 'AC');
INSERT INTO `pro_logseventos` VALUES (4, 1, 2, 'Se actualizó la Mascota con Id #1', '2025-10-28 02:33:23', 'AC');
INSERT INTO `pro_logseventos` VALUES (5, 1, 2, 'Se actualizó la Mascota con Id #1', '2025-10-28 02:35:06', 'AC');
INSERT INTO `pro_logseventos` VALUES (6, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.68.140', '2025-10-29 13:09:47', 'AC');
INSERT INTO `pro_logseventos` VALUES (7, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.68.140', '2025-11-02 11:06:19', 'AC');
INSERT INTO `pro_logseventos` VALUES (8, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.68.140', '2025-11-02 11:08:02', 'AC');
INSERT INTO `pro_logseventos` VALUES (9, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.68.140', '2025-11-02 11:12:13', 'AC');
INSERT INTO `pro_logseventos` VALUES (10, 1, 2, 'Se actualizó la Mascota con Id #1', '2025-11-02 11:21:50', 'AC');
INSERT INTO `pro_logseventos` VALUES (11, 1, 1, 'La mascota: Lucky fue registrada con éxito', '2025-11-02 11:24:36', 'AC');
INSERT INTO `pro_logseventos` VALUES (12, 1, 1, 'La mascota: Lucky fue registrada con éxito', '2025-11-02 14:22:18', 'AC');
INSERT INTO `pro_logseventos` VALUES (13, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.68.140', '2025-11-02 14:49:17', 'AC');
INSERT INTO `pro_logseventos` VALUES (14, 1, 1, 'La mascota: Poli fue registrada con éxito', '2025-11-02 17:00:23', 'AC');
INSERT INTO `pro_logseventos` VALUES (15, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-02 23:56:06', 'AC');
INSERT INTO `pro_logseventos` VALUES (16, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-02 23:59:39', 'AC');
INSERT INTO `pro_logseventos` VALUES (17, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-03 00:02:03', 'AC');
INSERT INTO `pro_logseventos` VALUES (18, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-03 00:02:53', 'AC');
INSERT INTO `pro_logseventos` VALUES (19, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-03 00:05:49', 'AC');
INSERT INTO `pro_logseventos` VALUES (20, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-03 00:10:47', 'AC');
INSERT INTO `pro_logseventos` VALUES (21, 1, 1, 'La mascota: GIACOMINO,GUARDIANO DELLE GALASSIE E DELL\'IPERSPAZIO fue registrada con éxito', '2025-11-03 16:47:34', 'AC');
INSERT INTO `pro_logseventos` VALUES (22, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.55', '2025-11-03 17:48:09', 'AC');
INSERT INTO `pro_logseventos` VALUES (23, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.68.153', '2025-11-04 21:43:38', 'AC');
INSERT INTO `pro_logseventos` VALUES (24, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.68.153', '2025-11-04 22:24:43', 'AC');
INSERT INTO `pro_logseventos` VALUES (25, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-10 02:55:45', 'AC');
INSERT INTO `pro_logseventos` VALUES (26, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-10 12:58:20', 'AC');
INSERT INTO `pro_logseventos` VALUES (27, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.59', '2025-11-10 16:38:09', 'AC');
INSERT INTO `pro_logseventos` VALUES (28, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.59', '2025-11-10 16:59:31', 'AC');
INSERT INTO `pro_logseventos` VALUES (29, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.59', '2025-11-10 17:39:30', 'AC');
INSERT INTO `pro_logseventos` VALUES (30, 1, 8, 'Intentaron acceder al sistema con el Usuario: \" dmartinez \" | Contraseña: \" Lambi1524 \" desde la IP Pública: ::1 | IP Local: 10.10.0.59', '2025-11-10 18:09:32', 'AC');
INSERT INTO `pro_logseventos` VALUES (31, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.59', '2025-11-10 18:09:38', 'AC');
INSERT INTO `pro_logseventos` VALUES (32, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.68.133', '2025-11-10 22:37:52', 'AC');
INSERT INTO `pro_logseventos` VALUES (33, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.108', '2025-11-13 16:16:12', 'AC');
INSERT INTO `pro_logseventos` VALUES (34, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.238', '2025-11-14 16:12:39', 'AC');
INSERT INTO `pro_logseventos` VALUES (35, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.238', '2025-11-14 18:17:07', 'AC');
INSERT INTO `pro_logseventos` VALUES (36, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-17 18:07:44', 'AC');
INSERT INTO `pro_logseventos` VALUES (37, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-17 23:27:52', 'AC');
INSERT INTO `pro_logseventos` VALUES (38, 1, 1, 'El producto: Croquetas Adulto Razas Medianas fue registrado con éxito', '2025-11-18 08:07:58', 'AC');
INSERT INTO `pro_logseventos` VALUES (39, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.204', '2025-11-19 16:05:50', 'AC');
INSERT INTO `pro_logseventos` VALUES (40, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.204', '2025-11-19 16:13:41', 'AC');
INSERT INTO `pro_logseventos` VALUES (41, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" dmartinez \" | Contraseña: \" lAMBO1524 \" desde la IP Pública: ::1 | IP Local: 10.10.0.248', '2025-11-20 16:48:48', 'AC');
INSERT INTO `pro_logseventos` VALUES (42, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.248', '2025-11-20 16:48:55', 'AC');
INSERT INTO `pro_logseventos` VALUES (43, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.68.135', '2025-11-22 18:37:13', 'AC');
INSERT INTO `pro_logseventos` VALUES (44, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.185', '2025-11-24 16:28:30', 'AC');
INSERT INTO `pro_logseventos` VALUES (45, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-24 23:05:19', 'AC');
INSERT INTO `pro_logseventos` VALUES (46, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-28 11:07:35', 'AC');
INSERT INTO `pro_logseventos` VALUES (47, 1, 1, 'Movimiento: SALIDA fue registrado con éxito', '2025-11-28 18:30:58', 'AC');
INSERT INTO `pro_logseventos` VALUES (48, 1, 1, 'Donador: DIEGO fue registrado con éxito', '2025-11-29 09:51:17', 'AC');
INSERT INTO `pro_logseventos` VALUES (49, 1, 1, 'La mascota: Snowy fue registrada con éxito', '2025-11-30 06:04:47', 'AC');
INSERT INTO `pro_logseventos` VALUES (50, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-30 06:06:17', 'AC');
INSERT INTO `pro_logseventos` VALUES (51, 1, 8, 'El Usuario: dmartinez accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.113', '2025-11-30 08:32:14', 'AC');
INSERT INTO `pro_logseventos` VALUES (52, 1, 1, 'Interesado: DIEGO fue registrado con éxito', '2025-11-30 22:13:39', 'AC');
INSERT INTO `pro_logseventos` VALUES (53, 1, 1, 'Interesado: ERICK fue registrado con éxito', '2025-11-30 22:17:29', 'AC');
INSERT INTO `pro_logseventos` VALUES (54, 1, 1, 'Cita: 1 fue registrada con éxito', '2025-12-01 00:02:23', 'AC');

-- ----------------------------
-- Table structure for pro_movimientosinventario
-- ----------------------------
DROP TABLE IF EXISTS `pro_movimientosinventario`;
CREATE TABLE `pro_movimientosinventario`  (
  `eCodMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `eCodProducto` int(11) NOT NULL,
  `tTipoMovimiento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nCantidad` int(11) NOT NULL,
  `eCodMotivo` int(11) NOT NULL,
  `tOrigenDestino` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `tObservaciones` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fhFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eCodMovimiento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_movimientosinventario
-- ----------------------------
INSERT INTO `pro_movimientosinventario` VALUES (1, 1, 'SALIDA', 3, 1, 'Petco', 1, 'Compra de Petco', '2025-11-28 18:30:58');

-- ----------------------------
-- Table structure for rel_perfilespermisos
-- ----------------------------
DROP TABLE IF EXISTS `rel_perfilespermisos`;
CREATE TABLE `rel_perfilespermisos`  (
  `eCodPerfilPermiso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodPerfil` int(10) UNSIGNED NOT NULL,
  `eCodPermiso` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`eCodPerfilPermiso`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 308 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rel_perfilespermisos
-- ----------------------------
INSERT INTO `rel_perfilespermisos` VALUES (17, 4, 10);
INSERT INTO `rel_perfilespermisos` VALUES (18, 4, 11);
INSERT INTO `rel_perfilespermisos` VALUES (19, 4, 12);
INSERT INTO `rel_perfilespermisos` VALUES (282, 1, 1);
INSERT INTO `rel_perfilespermisos` VALUES (283, 1, 2);
INSERT INTO `rel_perfilespermisos` VALUES (284, 1, 3);
INSERT INTO `rel_perfilespermisos` VALUES (285, 1, 5);
INSERT INTO `rel_perfilespermisos` VALUES (286, 1, 6);
INSERT INTO `rel_perfilespermisos` VALUES (287, 1, 7);
INSERT INTO `rel_perfilespermisos` VALUES (288, 1, 8);
INSERT INTO `rel_perfilespermisos` VALUES (289, 1, 9);
INSERT INTO `rel_perfilespermisos` VALUES (290, 1, 10);
INSERT INTO `rel_perfilespermisos` VALUES (291, 1, 11);
INSERT INTO `rel_perfilespermisos` VALUES (292, 1, 12);
INSERT INTO `rel_perfilespermisos` VALUES (293, 1, 13);
INSERT INTO `rel_perfilespermisos` VALUES (294, 1, 38);
INSERT INTO `rel_perfilespermisos` VALUES (295, 1, 39);
INSERT INTO `rel_perfilespermisos` VALUES (296, 1, 40);
INSERT INTO `rel_perfilespermisos` VALUES (297, 1, 41);
INSERT INTO `rel_perfilespermisos` VALUES (298, 1, 42);
INSERT INTO `rel_perfilespermisos` VALUES (299, 1, 52);
INSERT INTO `rel_perfilespermisos` VALUES (300, 1, 43);
INSERT INTO `rel_perfilespermisos` VALUES (301, 1, 44);
INSERT INTO `rel_perfilespermisos` VALUES (302, 1, 45);
INSERT INTO `rel_perfilespermisos` VALUES (303, 1, 46);
INSERT INTO `rel_perfilespermisos` VALUES (304, 1, 47);
INSERT INTO `rel_perfilespermisos` VALUES (305, 1, 48);
INSERT INTO `rel_perfilespermisos` VALUES (306, 1, 49);
INSERT INTO `rel_perfilespermisos` VALUES (307, 1, 51);

-- ----------------------------
-- View structure for vcitas
-- ----------------------------
DROP VIEW IF EXISTS `vcitas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vcitas` AS select `pro_citas`.`eCodCita` AS `eCodCita`,`cat_interesados`.`tNombre` AS `tInteresado`,`cat_interesados`.`tApellidoPaterno` AS `tApellidoPaterno`,`cat_mascotas`.`tNombre` AS `tMascota`,`pro_citas`.`fhFechaHora` AS `fhFechaHora`,`pro_citas`.`tMotivo` AS `tMotivo`,`pro_citas`.`tTipoCita` AS `tTipoCita`,`cat_estatus`.`tCodEstatus` AS `tCodEstatus`,`cat_estatus`.`tNombre` AS `tNombre`,`cat_estatus`.`tClase` AS `tClase`,`pro_citas`.`eCodInteresado` AS `eCodInteresado`,`pro_citas`.`eCodMascota` AS `eCodMascota` from (((`pro_citas` join `cat_estatus` on((`pro_citas`.`tCodEstatus` = `cat_estatus`.`tCodEstatus`))) join `cat_interesados` on((`pro_citas`.`eCodInteresado` = `cat_interesados`.`eCodInteresado`))) join `cat_mascotas` on((`pro_citas`.`eCodMascota` = `cat_mascotas`.`eCodMascota`)));

-- ----------------------------
-- View structure for vdonadores
-- ----------------------------
DROP VIEW IF EXISTS `vdonadores`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vdonadores` AS select `cat_donadores`.`eCodDonador` AS `eCodDonador`,`cat_donadores`.`tNombre` AS `tNombre`,`cat_donadores`.`tApellido` AS `tApellido`,`cat_donadores`.`tCorreo` AS `tCorreo`,`cat_donadores`.`tTelefono` AS `tTelefono`,`cat_donadores`.`tTipoDonador` AS `tTipoDonador`,`cat_donadores`.`tDireccion` AS `tDireccion`,`cat_estados`.`tNombre` AS `tEstados`,`cat_ciudades`.`tNombre` AS `tCiudades`,`cat_donadores`.`tCodigoPostal` AS `tCodigoPostal`,`cat_donadores`.`tNotas` AS `tNotas`,`cat_donadores`.`fhRegistro` AS `fhRegistro`,`cat_estatus`.`tCodEstatus` AS `tCodEstatus`,`cat_estatus`.`tNombre` AS `tEstatus`,`cat_estatus`.`tClase` AS `tClase`,`cat_donadores`.`eCodCiudad` AS `eCodCiudad`,`cat_donadores`.`eCodEstado` AS `eCodEstado` from (((`cat_estados` join `cat_donadores` on((`cat_estados`.`eCodEstado` = `cat_donadores`.`eCodEstado`))) join `cat_ciudades` on((`cat_ciudades`.`eCodCiudad` = `cat_donadores`.`eCodCiudad`))) join `cat_estatus` on((`cat_donadores`.`tCodEstatus` = `cat_estatus`.`tCodEstatus`)));

-- ----------------------------
-- View structure for vespecies
-- ----------------------------
DROP VIEW IF EXISTS `vespecies`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vespecies` AS select `cat_especies`.`eCodEspecie` AS `eCodEspecie`,`cat_especies`.`tNombre` AS `tNombre`,`cat_especies`.`tCodEstatus` AS `tCodEstatus` from `cat_especies`;

-- ----------------------------
-- View structure for vgeneros
-- ----------------------------
DROP VIEW IF EXISTS `vgeneros`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vgeneros` AS select `cat_generos`.`eCodGenero` AS `eCodGenero`,`cat_generos`.`tNombre` AS `tNombre` from `cat_generos`;

-- ----------------------------
-- View structure for vinteresados
-- ----------------------------
DROP VIEW IF EXISTS `vinteresados`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vinteresados` AS select `cat_interesados`.`eCodInteresado` AS `eCodInteresado`,`cat_interesados`.`tNombre` AS `tInteresado`,`cat_interesados`.`tApellidoPaterno` AS `tApellidoPaterno`,`cat_interesados`.`tTelefono` AS `tTelefono`,`cat_interesados`.`tCorreo` AS `tCorreo`,`cat_interesados`.`tPreferenciaMascota` AS `tPreferenciaMascota`,`cat_interesados`.`tMotivoContacto` AS `tMotivoContacto`,`cat_interesados`.`tEstadoSolicitud` AS `tEstadoSolicitud`,`cat_estatus`.`tCodEstatus` AS `tCodEstatus`,`cat_estatus`.`tNombre` AS `tNombre`,`cat_estatus`.`tClase` AS `tClase` from (`cat_estatus` join `cat_interesados` on((`cat_estatus`.`tCodEstatus` = `cat_interesados`.`tCodEstatus`)));

-- ----------------------------
-- View structure for vmascotas
-- ----------------------------
DROP VIEW IF EXISTS `vmascotas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vmascotas` AS select `cat_mascotas`.`eCodMascota` AS `eCodMascota`,`cat_mascotas`.`tNombre` AS `tMascota`,`cat_mascotas`.`eEdad` AS `eEdad`,`cat_mascotas`.`dPeso` AS `dPeso`,`cat_mascotas`.`tEnfermedad` AS `tEnfermedad`,`cat_mascotas`.`tDescripcion` AS `tDescripcion`,`cat_mascotas`.`tFoto` AS `tFoto`,`cat_especies`.`tNombre` AS `tEspecie`,`cat_razas`.`tNombre` AS `tRaza`,`cat_estatus`.`tCodEstatus` AS `tCodEstatus`,`cat_estatus`.`tNombre` AS `tEstatus`,`cat_estatus`.`tClase` AS `tClase`,`cat_mascotas`.`eCodEspecie` AS `eCodEspecie`,`cat_mascotas`.`eCodRaza` AS `eCodRaza` from (((`cat_mascotas` join `cat_especies` on((`cat_mascotas`.`eCodEspecie` = `cat_especies`.`eCodEspecie`))) join `cat_razas` on((`cat_mascotas`.`eCodRaza` = `cat_razas`.`eCodRaza`))) join `cat_estatus` on((`cat_mascotas`.`tCodEstatus` = `cat_estatus`.`tCodEstatus`)));

-- ----------------------------
-- View structure for vmovimientos
-- ----------------------------
DROP VIEW IF EXISTS `vmovimientos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vmovimientos` AS select `pro_movimientosinventario`.`eCodMovimiento` AS `eCodMovimiento`,`cat_productos`.`tNombre` AS `tProductos`,`pro_movimientosinventario`.`tTipoMovimiento` AS `tMovimientos`,`pro_movimientosinventario`.`nCantidad` AS `nCantidad`,`cat_motivos_movimiento`.`tMotivo` AS `tMotivos`,`pro_movimientosinventario`.`tOrigenDestino` AS `tOrigenDestino`,`cat_usuarios`.`tUsuario` AS `tUsuarios`,`pro_movimientosinventario`.`tObservaciones` AS `tObservaciones`,`pro_movimientosinventario`.`fhFecha` AS `fhFecha`,`cat_productos`.`tCodEstatus` AS `tCodEstatus` from (((`pro_movimientosinventario` join `cat_productos` on((`pro_movimientosinventario`.`eCodProducto` = `cat_productos`.`eCodProducto`))) join `cat_motivos_movimiento` on((`pro_movimientosinventario`.`eCodMotivo` = `cat_motivos_movimiento`.`eCodMotivo`))) join `cat_usuarios` on((`pro_movimientosinventario`.`eCodUsuario` = `cat_usuarios`.`eCodUsuario`)));

-- ----------------------------
-- View structure for vproductos
-- ----------------------------
DROP VIEW IF EXISTS `vproductos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vproductos` AS select `cat_productos`.`eCodProducto` AS `eCodProducto`,`cat_productos`.`tNombre` AS `tProductos`,`cat_productos`.`tDescripcion` AS `tDescripcion`,`cat_productos`.`tUnidad` AS `tUnidad`,`cat_productos`.`nPrecioCompra` AS `nPrecioCompra`,`cat_productos`.`nStockMinimo` AS `nStockMinimo`,`cat_productos`.`fRegistro` AS `fRegistro`,`cat_categoriasproductos`.`tNombre` AS `tCategoria`,`cat_proveedores`.`tNombre` AS `tProveedores`,`cat_marcas`.`tNombre` AS `tMarcas`,`cat_productos`.`tCodEstatus` AS `tCodEstatus`,`cat_productos`.`eCodCategoriaProductos` AS `eCodCategoriaProductos`,`cat_productos`.`eCodProveedor` AS `eCodProveedor`,`cat_productos`.`eCodMarca` AS `eCodMarca` from (((`cat_productos` join `cat_categoriasproductos` on((`cat_productos`.`eCodCategoriaProductos` = `cat_categoriasproductos`.`eCodCategoriaProductos`))) join `cat_proveedores` on((`cat_productos`.`eCodProveedor` = `cat_proveedores`.`eCodProveedor`))) join `cat_marcas` on((`cat_productos`.`eCodMarca` = `cat_marcas`.`eCodMarca`)));

-- ----------------------------
-- View structure for vrazas
-- ----------------------------
DROP VIEW IF EXISTS `vrazas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vrazas` AS select `cat_razas`.`eCodRaza` AS `eCodRaza`,`cat_razas`.`tNombre` AS `tNombre`,`cat_razas`.`eCodEspecie` AS `eCodEspecie`,`cat_razas`.`tCodEstatus` AS `tCodEstatus` from `cat_razas`;

-- ----------------------------
-- View structure for vusuarios
-- ----------------------------
DROP VIEW IF EXISTS `vusuarios`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vusuarios` AS select `cu`.`eCodUsuario` AS `eCodUsuario`,`cu`.`eCodEmpresa` AS `eCodEmpresa`,`cu`.`eCodDepartamento` AS `eCodDepartamento`,`cu`.`eCodPerfil` AS `eCodPerfil`,`cu`.`bAdmin` AS `bAdmin`,`cu`.`tNombre` AS `tNombre`,`cu`.`tCorreo` AS `tCorreo`,`cu`.`tTelefono` AS `tTelefono`,`cu`.`tUsuario` AS `tUsuario`,`cu`.`tPassword` AS `tPassword`,`cu`.`tPuesto` AS `tPuesto`,`cu`.`tImagen` AS `tImagen`,`cu`.`tCodEstatus` AS `tCodEstatus`,`ce`.`tNombre` AS `tEmpresa`,`cd`.`tNombre` AS `tDepartamento`,`cp`.`tNombre` AS `tPerfil`,date_format(`cu`.`fhFechaRegistro`,'%d.%m.%Y %H:%i:%s') AS `fhFechaRegistro`,date_format(`cu`.`fhFechaActualizacion`,'%d.%m.%Y %H:%i:%s') AS `fhFechaActualizacion`,`ces`.`tNombre` AS `tEstatus` from ((((`cat_usuarios` `cu` left join `cat_empresas` `ce` on((`ce`.`eCodEmpresa` = `cu`.`eCodEmpresa`))) left join `cat_departamentos` `cd` on((`cd`.`eCodDepartamento` = `cu`.`eCodDepartamento`))) left join `cat_perfiles` `cp` on((`cp`.`eCodPerfil` = `cu`.`eCodPerfil`))) left join `cat_estatus` `ces` on((`ces`.`tCodEstatus` = `cu`.`tCodEstatus`)));

-- ----------------------------
-- Procedure structure for stpConsultarMascotas
-- ----------------------------
DROP PROCEDURE IF EXISTS `stpConsultarMascotas`;
delimiter ;;
CREATE PROCEDURE `stpConsultarMascotas`(IN p_eCodMascota INT,
    IN p_eCodEspecie INT,
    IN p_eCodRaza INT,
    IN p_tNombre VARCHAR(100))
BEGIN
    SELECT 
        m.eCodMascota,
        m.tNombre AS NombreMascota,
        m.eEdad,
        e.tNombre AS Especie,
        r.tNombre AS Raza,
        s.tDescripcion AS Estatus
    FROM 
        cat_mascotas m
    INNER JOIN cat_especies e ON e.eCodEspecie = m.eCodEspecie
    INNER JOIN cat_razas r ON r.eCodRaza = m.eCodRaza
    INNER JOIN cat_estatusmascotas s ON s.eCodEstatus = m.eCodEstatus
    
    WHERE 1=1 -- Cláusula siempre verdadera para encadenar WHEREs opcionales
        
        -- Filtra por Mascota si el parámetro NO es NULL
        AND (p_eCodMascota IS NULL OR m.eCodMascota = p_eCodMascota)
        
        -- Filtra por Especie si el parámetro NO es NULL
        AND (p_eCodEspecie IS NULL OR m.eCodEspecie = p_eCodEspecie)
        
        -- Filtra por Raza si el parámetro NO es NULL
        AND (p_eCodRaza IS NULL OR m.eCodRaza = p_eCodRaza)
        
        -- Filtra por Nombre (usando LIKE para búsqueda parcial) si el parámetro NO es NULL
        AND (p_tNombre IS NULL OR m.tNombre LIKE CONCAT('%', p_tNombre, '%'));

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
