/* Waters Quanpedia is property of Waters corporation and is not subjected to any duplication, change or modification without their permission. */

CREATE TABLE Analysis (AnalysisID integer, Name text, MethodID integer, Info text, Summary text, IonExportMode integer, PRIMARY KEY (AnalysisID))
CREATE TABLE ColumnChemistry (ColumnChemistryID integer, Name text, GC logical, PRIMARY KEY (ColumnChemistryID))
CREATE TABLE ColumnDiameter (ColumnDiameterID integer, Name text, GC logical, PRIMARY KEY (ColumnDiameterID))
CREATE TABLE ColumnLength (ColumnLengthID integer, Name text, GC logical, PRIMARY KEY (ColumnLengthID))
CREATE TABLE ColumnParticle (ColumnParticleID integer, Name text, GC logical, PRIMARY KEY (ColumnParticleID))
CREATE TABLE Columns (ColumnsID integer, Name text, ChemistryID integer, LengthID integer, DiameterID integer, ParticleID integer, GC logical, PartNo text, Info text, PRIMARY KEY (ColumnsID))
CREATE TABLE Compound (CompoundID integer, Name text, Formula text, Mass text, CAS text, Info text, Structure text, PRIMARY KEY (CompoundID))
CREATE TABLE CompoundType (CompoundTypeID integer, Name text, PRIMARY KEY (CompoundTypeID))
CREATE TABLE CompoundsInAnalysis (CompoundsInAnalysisID integer, AnalysisID integer, IonDetailsID integer, PRIMARY KEY (CompoundsInAnalysisID))
CREATE TABLE CompoundsInGroup (CompoundsInGroupID integer, CompoundID integer, GroupID integer, PRIMARY KEY (CompoundsInGroupID))
CREATE TABLE Groups (GroupsID integer, Name text, Info text, PRIMARY KEY (GroupsID))
CREATE TABLE IonDetails (IonDetailsID integer, CompoundID integer, IonModeID integer, Type integer, AcquisitionDetails1 integer, AcquisitionDetails2 integer, AcquisitionDetails3 integer, AcquisitionDetails4 integer, AcquisitionDetails5 integer, SpectrumID integer, PRIMARY KEY (IonDetailsID))
CREATE TABLE IonMode (IonModeID integer, Name text, MixesWith1 integer, MixesWith2 integer, MixesWith3 integer, MixesWith4 integer, MixesWith5 integer, MixesWith6 integer, MixesWith7 integer, MixesWith8 integer, MixesWith9 integer, GC logical, PRIMARY KEY (IonModeID))
CREATE TABLE Lock (ReadOnly logical, Locked logical)
CREATE TABLE Method (MethodID integer, GUID text, Name text, ColumnID integer, GC logical, InletType text, AutosamplerType text, DetectorType1 text, DetectorType2 text, Summary text, Advice text, PRIMARY KEY (MethodID))
CREATE TABLE MethodBlob (MethodBlobID integer, Extension text, MethodID integer, Blob text, PRIMARY KEY (MethodBlobID))
CREATE TABLE MrmAcquisitionDetails (AcquisitionDetailsID integer, ParentMass number, ProductMass number, CV integer, CE integer, PRIMARY KEY (AcquisitionDetailsID))
CREATE TABLE QuanIonDetails (QuanIonDetailsID integer, Main logical, Ratio number, UseInResponse logical, AcquisitionDetailsID integer, PRIMARY KEY (QuanIonDetailsID))
CREATE TABLE QuantitationDetails (QuantitationDetailsID integer, MethodID integer, IonDetailsID integer, CompoundTypeID integer, UseRRT logical, RT number, RRT number, RRTRefID integer, IS1ID integer, IS2ID integer, IS3ID integer, IS4ID integer, IS5ID integer, IS6ID integer, CalRefID integer, QuanIonDetails1ID integer, QuanIonDetails2ID integer, QuanIonDetails3ID integer, QuanIonDetails4ID integer, QuanIonDetails5ID integer, UsePPM logical, MassWindow number, AcquisitionWindow number, IntegrationWindow number, PRIMARY KEY (QuantitationDetailsID))
CREATE TABLE SirAcquisitionDetails (AcquisitionDetailsID integer, Mass number, CV integer, PRIMARY KEY (AcquisitionDetailsID))
CREATE TABLE Spectra (SpectrumID integer, Spectrum text, PRIMARY KEY (SpectrumID))
CREATE TABLE Version (Version integer, PRIMARY KEY (Version))


CREATE VIEW CompoundsView AS SELECT Compound.*, CompoundsInGroup.CompoundsInGroupID AS CompoundsInGroupsID, GroupID FROM CompoundsInGroup INNER JOIN Compound ON CompoundsInGroup.CompoundID = Compound.CompoundID

CREATE VIEW MRMIonDetailsView AS SELECT IonDetailsID, IonDetails.CompoundID AS CompoundID, IonDetails.IonModeID AS IonModeID, IonDetails.Type AS ModeType, MrmAcquisitionDetails.AcquisitionDetailsID AS AcquisitionDetailsID, ParentMass, ProductMass, CV, CE FROM MrmAcquisitionDetails INNER JOIN IonDetails WHERE (MrmAcquisitionDetails.AcquisitionDetailsID IN (IonDetails.AcquisitionDetails1, IonDetails.AcquisitionDetails2, IonDetails.AcquisitionDetails3, IonDetails.AcquisitionDetails4, IonDetails.AcquisitionDetails5) AND IonDetails.Type IN (2,4) ) ORDER BY IonDetailsID

CREATE VIEW QuanIonView AS SELECT QuantitationDetails.*, QuanIonDetails.QuanIonDetailsID AS QuanIonDetailsID, QuanIonDetails.Main AS Main, QuanIonDetails.UseInResponse AS UseInResponse, QuanIonDetails.Ratio AS Ratio, QuanIonDetails.AcquisitionDetailsID AS AcquisitionDetailsID FROM QuanIonDetails INNER JOIN QuantitationDetails ON (QuanIonDetails.QuanIonDetailsID IN (QuantitationDetails.QuanIonDetails5ID, QuantitationDetails.QuanIonDetails4ID, QuantitationDetails.QuanIonDetails3ID, QuantitationDetails.QuanIonDetails2ID, QuantitationDetails.QuanIonDetails1ID)) ORDER BY QuantitationDetails.IonDetailsID

CREATE VIEW SIRIonDetailsView AS SELECT IonDetailsID, IonDetails.CompoundID AS CompoundID, IonDetails.IonModeID AS IonModeID, IonDetails.Type AS ModeType, SirAcquisitionDetails.AcquisitionDetailsID AS AcquisitionDetailsID, Mass, CV FROM SirAcquisitionDetails INNER JOIN IonDetails WHERE (SirAcquisitionDetails.AcquisitionDetailsID IN (IonDetails.AcquisitionDetails1, IonDetails.AcquisitionDetails2, IonDetails.AcquisitionDetails3, IonDetails.AcquisitionDetails4, IonDetails.AcquisitionDetails5) AND IonDetails.Type IN (1,8) ) ORDER BY IonDetailsID


