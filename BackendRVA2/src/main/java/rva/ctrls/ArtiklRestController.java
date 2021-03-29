package rva.ctrls;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonIgnore;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Artikl;
import rva.repository.ArtiklRepository;

@CrossOrigin
@RestController
@Api(tags = {"Artikl CRUD operacije"})
public class ArtiklRestController {
	
	@Autowired
	private ArtiklRepository artiklRepository;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@GetMapping("artikl")
	@ApiOperation(value="Vraća kolekciju svih artikala iz vbaze podataka")
	public Collection<Artikl> getArtikli() {
		return artiklRepository.findAll();
	}

	@GetMapping("artikl/{id}")
	@ApiOperation(value="Vraća artikl na osnovu prosleđenog ID-ija")
	public Artikl getArtikl(@PathVariable("id") Integer id) {
		return artiklRepository.getOne(id);
	}
	@GetMapping("artiklNaziv/{naziv}")
	@ApiOperation(value="Vraća kolekciju artikala na osnovu prođenjog naziva artikla")
	public Collection<Artikl> getArtiklByNaziv(@PathVariable("naziv") String naziv) {
		return artiklRepository.findByNazivContainingIgnoreCase(naziv);
	}
	@PostMapping("artikl")
	@ApiOperation(value="Dodaje novi artikl u bazu podataka")
	public ResponseEntity<Artikl> insertArtikl(@RequestBody Artikl artikl) {
		if (!artiklRepository.existsById(artikl.getId())) {
			artiklRepository.save(artikl);
			return new ResponseEntity<Artikl>(HttpStatus.OK); 
		}
		return new ResponseEntity<Artikl>(HttpStatus.CONFLICT);
	}
	@PutMapping("artikl")
	@ApiOperation(value="Update-uje artikl iz baze podataka")
	public ResponseEntity<Artikl> updateArtikl(@RequestBody Artikl artikl) {
		if (!artiklRepository.existsById(artikl.getId()))
			return new ResponseEntity<Artikl>(HttpStatus.CONFLICT);
		artiklRepository.save(artikl);
		return new ResponseEntity<Artikl>(HttpStatus.OK);
	}
	@DeleteMapping("artikl/{id}")
	@ApiOperation(value="Briše artikl iz baze podataka (na osnovu prosleđene ID vrednosti)")
	public ResponseEntity<Artikl> deleteArtikl(@PathVariable Integer id)  {
		if (!artiklRepository.existsById(id))
			return new ResponseEntity<Artikl>(HttpStatus.NO_CONTENT);
		artiklRepository.deleteById(id);
		if (id == -100)
			jdbcTemplate.execute(" INSERT INTO \"artikl\" (\"id\", \"naziv\", \"proizvodjac\") "
					+ "VALUES (-100, 'Naziv test', 'Proizvodjac test')");
		return new ResponseEntity<Artikl>(HttpStatus.OK);
	}
	
	
	
}
