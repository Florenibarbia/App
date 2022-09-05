CREATE TABLE `Usuario`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,
    `apellido` VARCHAR(255) NOT NULL,
    `fecha_de_nacimiento` DATE NOT NULL,
    `dni` VARCHAR(255) NOT NULL,
    `telefono` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Usuario` ADD PRIMARY KEY `usuario_id_primary`(`id`);
CREATE TABLE `Local`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,
    `direccion` VARCHAR(255) NOT NULL,
    `coordenadas` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Local` ADD PRIMARY KEY `local_id_primary`(`id`);
CREATE TABLE `Pedido`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `local_fk` INT NOT NULL,
    `usuario_fk` VARCHAR(255) NOT NULL,
    `fecha` DATETIME NOT NULL
);
ALTER TABLE
    `Pedido` ADD PRIMARY KEY `pedido_id_primary`(`id`);
CREATE TABLE `Producto`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,
    `fecha_vencimiento` DATE NOT NULL,
    `local_fk` INT NOT NULL
);
ALTER TABLE
    `Producto` ADD PRIMARY KEY `producto_id_primary`(`id`);
CREATE TABLE `Producto_Pedido`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `producto_fk` INT NOT NULL,
    `pedido_fk` INT NOT NULL
);
ALTER TABLE
    `Producto_Pedido` ADD PRIMARY KEY `producto_pedido_id_primary`(`id`);
ALTER TABLE
    `Producto` ADD CONSTRAINT `producto_local_fk_foreign` FOREIGN KEY(`local_fk`) REFERENCES `Local`(`id`);
ALTER TABLE
    `Pedido` ADD CONSTRAINT `pedido_local_fk_foreign` FOREIGN KEY(`local_fk`) REFERENCES `Local`(`id`);
ALTER TABLE
    `Pedido` ADD CONSTRAINT `pedido_usuario_fk_foreign` FOREIGN KEY(`usuario_fk`) REFERENCES `Usuario`(`id`);
ALTER TABLE
    `Producto_Pedido` ADD CONSTRAINT `producto_pedido_producto_fk_foreign` FOREIGN KEY(`producto_fk`) REFERENCES `Producto`(`id`);
ALTER TABLE
    `Producto_Pedido` ADD CONSTRAINT `producto_pedido_pedido_fk_foreign` FOREIGN KEY(`pedido_fk`) REFERENCES `Pedido`(`id`);