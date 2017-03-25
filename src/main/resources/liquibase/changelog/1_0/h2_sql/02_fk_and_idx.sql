/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
ALTER TABLE `Album`
  ADD CONSTRAINT `FK_AlbumArtistId`
FOREIGN KEY (`ArtistId`) REFERENCES `Artist` (`ArtistId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE INDEX `IFK_AlbumArtistId`
  ON `Album` (`ArtistId`);

ALTER TABLE `Customer`
  ADD CONSTRAINT `FK_CustomerSupportRepId`
FOREIGN KEY (`SupportRepId`) REFERENCES `Employee` (`EmployeeId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE INDEX `IFK_CustomerSupportRepId`
  ON `Customer` (`SupportRepId`);

ALTER TABLE `Employee`
  ADD CONSTRAINT `FK_EmployeeReportsTo`
FOREIGN KEY (`ReportsTo`) REFERENCES `Employee` (`EmployeeId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE INDEX `IFK_EmployeeReportsTo`
  ON `Employee` (`ReportsTo`);

ALTER TABLE `Invoice`
  ADD CONSTRAINT `FK_InvoiceCustomerId`
FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE INDEX `IFK_InvoiceCustomerId`
  ON `Invoice` (`CustomerId`);

ALTER TABLE `InvoiceLine`
  ADD CONSTRAINT `FK_InvoiceLineInvoiceId`
FOREIGN KEY (`InvoiceId`) REFERENCES `Invoice` (`InvoiceId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE INDEX `IFK_InvoiceLineInvoiceId`
  ON `InvoiceLine` (`InvoiceId`);

ALTER TABLE `InvoiceLine`
  ADD CONSTRAINT `FK_InvoiceLineTrackId`
FOREIGN KEY (`TrackId`) REFERENCES `Track` (`TrackId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE INDEX `IFK_InvoiceLineTrackId`
  ON `InvoiceLine` (`TrackId`);

ALTER TABLE `PlaylistTrack`
  ADD CONSTRAINT `FK_PlaylistTrackPlaylistId`
FOREIGN KEY (`PlaylistId`) REFERENCES `Playlist` (`PlaylistId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `PlaylistTrack`
  ADD CONSTRAINT `FK_PlaylistTrackTrackId`
FOREIGN KEY (`TrackId`) REFERENCES `Track` (`TrackId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE INDEX `IFK_PlaylistTrackTrackId`
  ON `PlaylistTrack` (`TrackId`);

ALTER TABLE `Track`
  ADD CONSTRAINT `FK_TrackAlbumId`
FOREIGN KEY (`AlbumId`) REFERENCES `Album` (`AlbumId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE INDEX `IFK_TrackAlbumId`
  ON `Track` (`AlbumId`);

ALTER TABLE `Track`
  ADD CONSTRAINT `FK_TrackGenreId`
FOREIGN KEY (`GenreId`) REFERENCES `Genre` (`GenreId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE INDEX `IFK_TrackGenreId`
  ON `Track` (`GenreId`);

ALTER TABLE `Track`
  ADD CONSTRAINT `FK_TrackMediaTypeId`
FOREIGN KEY (`MediaTypeId`) REFERENCES `MediaType` (`MediaTypeId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE INDEX `IFK_TrackMediaTypeId`
  ON `Track` (`MediaTypeId`);