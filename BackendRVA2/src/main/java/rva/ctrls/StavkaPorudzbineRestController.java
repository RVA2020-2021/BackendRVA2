package rva.ctrls;

import java.math.BigDecimal;
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

import rva.jpa.Porudzbina;
import rva.jpa.StavkaPorudzbine;
import rva.repository.PorudzbinaRepository;
import rva.repository.StavkaPorudzbineRepository;

@CrossOrigin
@RestController
public class StavkaPorudzbineRestController {

	@Autowired 
	private StavkaPorudzbineRepository stavkaPorudzbineRepository;
	
	@Autowired
	private PorudzbinaRepository porudzbinaRepository;
	
	@Autowired 
	private JdbcTemplate jdbcTemplate;
	
	@GetMapping("stavkaPorudzbine")
	public Collection<StavkaPorudzbine> getStavkePorudzbine() {
		return stavkaPorudzbineRepository.findAll();
	}
	
	@GetMapping("stavkaPorudzbine/{id}")
	public StavkaPorudzbine getStavkaPorudzbine(@PathVariable("id") Integer id) {
		return stavkaPorudzbineRepository.getOne(id);
	}
	
	@GetMapping("stavkeZaPorudzbinaID/{id}")
	public Collection<StavkaPorudzbine> getStavkePoPorudzbini(@PathVariable("id") Integer id) {
		Porudzbina p = porudzbinaRepository.getOne(id); 
		return stavkaPorudzbineRepository.findByPorudzbina(p);
	}
	
	@GetMapping("stavkePorudzbineCena/{cena}")
	public Collection<StavkaPorudzbine> getStavkaPorudzbineCena(@PathVariable("cena") BigDecimal cena) {
		return stavkaPorudzbineRepository.findByCenaLessThanOrderById(cena);
	}
	
	@PostMapping("stavkaPorudzbine")
	public ResponseEntity<StavkaPorudzbine> insertStavkaPorudzbine(@RequestBody StavkaPorudzbine stavkaPorudzbine){
		if(!stavkaPorudzbineRepository.existsById(stavkaPorudzbine.getId()))
		{
			stavkaPorudzbine.setRedniBroj(stavkaPorudzbineRepository.nextRBr(stavkaPorudzbine.getPorudzbina().getId()));
			stavkaPorudzbineRepository.save(stavkaPorudzbine);
			return new ResponseEntity<StavkaPorudzbine>(HttpStatus.OK);
		}
		return new ResponseEntity<StavkaPorudzbine>(HttpStatus.CONFLICT);
	}
	@PutMapping("stavkaPorudzbine")
	public ResponseEntity<StavkaPorudzbine> updateStavkaPorudzbine(@RequestBody StavkaPorudzbine stavkaPorudzbine){
		if(!stavkaPorudzbineRepository.existsById(stavkaPorudzbine.getId()))
			return new ResponseEntity<StavkaPorudzbine>(HttpStatus.NO_CONTENT);
		stavkaPorudzbineRepository.save(stavkaPorudzbine);
		return new ResponseEntity<StavkaPorudzbine>(HttpStatus.OK);
	}
	@DeleteMapping("stavkaPorudzbine/{id}")
	public ResponseEntity<StavkaPorudzbine> deleteStavkaPorudzbine(@PathVariable("id") Integer id) {
		if(!stavkaPorudzbineRepository.existsById(id))
			return new ResponseEntity<StavkaPorudzbine>(HttpStatus.NO_CONTENT);
		
		stavkaPorudzbineRepository.deleteById(id);

		if(id==-100)
			jdbcTemplate.execute("INSERT INTO \"stavka_porudzbine\" (\"id\", \"redni_broj\", \"kolicina\", \"jedinica_mere\", \"cena\","
					+ "\"porudzbina\", \"artikl\") VALUES (-100, 100, 1, 'kom',1,1,1)");
		return new ResponseEntity<StavkaPorudzbine>(HttpStatus.OK);
	}
	
}
